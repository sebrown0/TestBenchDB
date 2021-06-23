CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_suites_and_cases_in_test_run`(IN includedIds MEDIUMTEXT)
BEGIN
	-- Get all the test suites' children
	DROP TABLE IF EXISTS test_suite_has_children;
	CREATE TEMPORARY TABLE test_suite_has_children WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name) AS (
		SELECT 		id, test_suite_id, test_suite_name
		FROM 		test_suite ts
		WHERE 		id IN(@inc) 
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

	DROP TABLE IF EXISTS child_suites;
	CREATE TEMPORARY TABLE child_suites
	SELECT 		children.id AS ts_row_id , children.test_suite_id, children.test_suite_name, ent.*
	FROM 		test_suite_has_children 
				children
	JOIN		entity
				ent
	ON			ent.id = children.id;

	DROP TABLE IF EXISTS temp_ts_and_tc_in_test_run;
    CREATE TEMPORARY TABLE temp_ts_and_tc_in_test_run
	SELECT 		* FROM child_suites
	UNION ALL
	SELECT 		children.* , ent.*	 
	FROM 		test_suite_has_children 
				children
	JOIN		entity_test
				test
	ON			test.parent_test_row_id = children.id
	JOIN 		entity
				ent
	ON			ent.id = test.entity_id
	ORDER BY 	ts_row_id;
END