CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elements_in_test_run`(IN trId INT UNSIGNED)
BEGIN
	DROP TABLE IF EXISTS test_run_has_test_suites;
	CREATE TEMPORARY TABLE test_run_has_test_suites WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name) AS (
		SELECT 		id, test_suite_id, test_suite_name
		FROM 		test_suite ts
		WHERE 		id IN(
						SELECT 		ts.id
						FROM 		test_run tr
						INNER JOIN 	test_run_has_test_suite tr_has_ts
								ON 	tr_has_ts.test_run_id = tr.id
						INNER JOIN 	test_suite ts
								ON 	ts.id = tr_has_ts.test_suite_row_id AND ts.test_suite_id = tr_has_ts.test_suite_id						
						WHERE 		tr.id = trId
					) 
		UNION ALL
		SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name
		FROM 		test_suite chld
		INNER JOIN 	test_suite_has_child_suites c
				ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
		INNER JOIN 	test_suite_has_version ts_has_ver
				ON 	ts_has_ver.test_suite_id = chld.id AND ts_has_ver.test_suite_test_suite_id = chld.test_suite_id		
	)
	SELECT 		MAX(ts2.id) AS id, ts2.test_suite_id, ts2.test_suite_name
	FROM 		test_suite_has_child_suites ts1
	INNER JOIN 	test_suite_has_child_suites ts2 
			ON 	ts1.test_suite_id = ts2.test_suite_id
	GROUP BY 	ts2.test_suite_id, ts2.test_suite_id, ts2.test_suite_name
	ORDER BY 	ts2.test_suite_id;

	-- Get element IDs
	DROP TABLE IF EXISTS test_run_elements;
	CREATE TABLE test_run_elements
	SELECT 	ts.id, ent.is_element  
	FROM 	entity ent
	JOIN	test_suite ts 
	ON		ts.id = ent.id	
	WHERE 	is_element > 1 AND ent.id IN(SELECT id from test_run_has_test_suites);

	-- Get all the test suites' children
	DROP TABLE IF EXISTS element_has_children;
	CREATE TEMPORARY TABLE element_has_children WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name) AS (
		SELECT 		id, test_suite_id, test_suite_name
		FROM 		test_suite ts
		WHERE 		id IN(SELECT is_element FROM test_run_elements) 
		UNION ALL
		SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name
		FROM 		test_suite chld
		INNER JOIN 	test_suite_has_child_suites c
				ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
		INNER JOIN 	test_suite_has_version ts_has_ver
				ON 	ts_has_ver.test_suite_id = chld.id AND ts_has_ver.test_suite_test_suite_id = chld.test_suite_id		
	)
	SELECT 		MAX(ts2.id) AS id, ts2.test_suite_id, ts2.test_suite_name
	FROM 		test_suite_has_child_suites ts1
	INNER JOIN 	test_suite_has_child_suites ts2 
			ON 	ts1.test_suite_id = ts2.test_suite_id
	GROUP BY 	ts2.test_suite_id, ts2.test_suite_id, ts2.test_suite_name
	ORDER BY 	ts2.test_suite_id;


	DROP TABLE IF EXISTS child_elements;
	CREATE TEMPORARY TABLE child_elements
	SELECT 		children.id AS ts_row_id , children.test_suite_id, children.test_suite_name, ent.*
	FROM 		element_has_children 
				children
	JOIN		entity
				ent
	ON			ent.id = children.id;

	DROP TABLE IF EXISTS temp_test_run_elements;
	CREATE TEMPORARY TABLE temp_test_run_elements
	SELECT 		* FROM child_elements
	UNION ALL
	SELECT 		children.* , ent.*	 
	FROM 		element_has_children 
				children
	JOIN		entity_test
				test
	ON			test.parent_test_row_id = children.id
	JOIN 		entity
				ent
	ON			ent.id = test.entity_id
	ORDER BY 	ts_row_id;    	
END