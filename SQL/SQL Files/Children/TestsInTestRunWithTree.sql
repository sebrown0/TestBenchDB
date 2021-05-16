USE `test_bench`;
DROP TABLE IF EXISTS tbl_test_suite_has_child_suites;
CREATE TABLE 	tbl_test_suite_has_child_suites WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id) AS (
	SELECT 		id, test_suite_id
	FROM 		test_suite 
	WHERE 		parent_id IN(
					SELECT 		ts.parent_id 
					FROM 		test_run tr
					INNER JOIN 	test_run_has_test_suite tr_has_ts
							ON 	tr_has_ts.test_run_id = tr.id
					INNER JOIN 	test_suite ts
							ON 	ts.id = tr_has_ts.test_suite_row_id AND ts.test_suite_id = tr_has_ts.test_suite_id
					WHERE 		tr.id = 2
				)
    UNION ALL
    SELECT 		chld.id, chld.test_suite_id
	FROM 		test_suite chld
	INNER JOIN 	test_suite_has_child_suites c
			ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
)
SELECT 			ts_has_test.test_suite_row_id, ts_has_test.test_suite_id, 
				ts_has_test.entity_test_id, ts_has_test.entity_test_entity_test_id
FROM 			test_suite_has_child_suites ts_has_chld
INNER JOIN 		test_suite_has_entity_test ts_has_test
		ON 		ts_has_chld.id = ts_has_test.test_suite_row_id AND ts_has_chld.test_suite_id = ts_has_test.test_suite_id ;

WITH RECURSIVE 	test_has_children (id, test_id, tree, level) AS (
	SELECT 		id, entity_test_id, entity_test_name as tree, 1 
	FROM 		entity_test 
	WHERE 		id IN (SELECT test_suite_row_id FROM tbl_test_suite_has_child_suites)
    UNION ALL
    SELECT 		chld.id, chld.entity_test_id, CONCAT(tst_has_chld.tree ,' -> ', chld.entity_test_name), tst_has_chld.level + 1 
	FROM 		entity_test chld
	INNER JOIN 	test_has_children tst_has_chld
			ON 	tst_has_chld.id = chld.parent_test_row_id AND tst_has_chld.test_id = chld.parent_test_id            
)SELECT * FROM 	test_has_children
	INNER JOIN 	entity_test tst
			ON 	tst.entity_test_id = test_has_children.test_id
	  ORDER BY  tst.id,test_has_children.level;