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
					WHERE 		tr.id = 11
				) 
	UNION ALL
	SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name
	FROM 		test_suite chld
	INNER JOIN 	test_suite_has_child_suites c
			ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
	INNER JOIN 	test_suite_has_version ts_has_ver
			ON 	ts_has_ver.test_suite_id = chld.id AND ts_has_ver.test_suite_test_suite_id = chld.test_suite_id		
)
SELECT 		 MAX(ts2.id) AS id, ts2.test_suite_id, ts2.test_suite_name
FROM 		test_suite_has_child_suites ts1
INNER JOIN 	test_suite_has_child_suites ts2 
		ON 	ts1.test_suite_id = ts2.test_suite_id
GROUP BY 	ts2.test_suite_id, ts2.test_suite_id, ts2.test_suite_name
ORDER BY 	ts2.test_suite_id;

-- Get element IDs
DROP TABLE IF EXISTS test_run_elements;
CREATE TABLE test_run_elements
SELECT 	 ts.id, ent.is_element  -- ts.*, ent.id AS entity_row_id, ent.entity_id
FROM 	entity ent
JOIN	test_suite ts 
ON		ts.id = ent.id	
-- WHERE 	is_element > 1 AND ent.id IN(@inc);
 -- WHERE 	is_element > 1 AND ent.id IN('1210','1212');
WHERE 	is_element > 1 AND ent.id IN(SELECT id from test_run_has_test_suites);

select * from test_run_elements;

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
SELECT * FROM element_has_children;

DROP TABLE IF EXISTS child_elements;
CREATE TEMPORARY TABLE child_elements
SELECT 		DISTINCT ent.id, ent.entity_id AS ENT_ID, ent.entity_name, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element,  ent.issue_status_id,
			children.id AS ts_row_id , children.test_suite_id, children.test_suite_name
FROM 		element_has_children 
			children
JOIN		entity
			ent
ON			ent.id = children.id;
SELECT * FROM child_elements;

DROP TABLE IF EXISTS test_run_elements;
CREATE TEMPORARY TABLE test_run_elements
SELECT 		* FROM child_elements
UNION ALL
SELECT 		
			DISTINCT ent.id, ent.entity_id AS ENT_ID, ent.entity_name, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element,  ent.issue_status_id,
            children.* 
FROM 		element_has_children 
			children
JOIN		entity_test
			test
ON			test.parent_test_row_id = children.id
JOIN 		entity
			ent
ON			ent.id = test.entity_id
GROUP BY	ent.id
ORDER BY 	ts_row_id;

select * from test_run_elements;

