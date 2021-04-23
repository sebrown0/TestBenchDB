
DROP TABLE IF EXISTS temp_test_suites_in_test_run;
CREATE TABLE temp_test_suites_in_test_run WITH RECURSIVE cteTestSuitesInTestRun (id) AS (
  SELECT     ts.id
  FROM       test_run tr
  INNER JOIN test_run_has_test_suite has
		  ON tr.id = has.test_run_id
  INNER JOIN test_suite ts
		  ON ts.id = has.test_suite_id
  WHERE      tr.id = 1
  UNION ALL
  SELECT     t.id			 
  FROM       test_suite t
  INNER JOIN cteTestSuitesInTestRun
		  ON t.test_suite_parent_id = cteTestSuitesInTestRun.id
)
SELECT DISTINCT(id) FROM cteTestSuitesInTestRun;

WITH RECURSIVE cteTestSuiteAndChildren (id, test_suite_name, test_suite_parent_id) AS (
  SELECT     id,
			 test_suite_name,
			 test_suite_parent_id
  FROM       test_suite
  WHERE      id  IN (SELECT * FROM temp_test_suites_in_test_run) 
  UNION ALL
  SELECT     t.id,
			 t.test_suite_name,
			 t.test_suite_parent_id
  FROM       test_suite t
  INNER JOIN cteTestSuiteAndChildren
		  ON t.test_suite_parent_id = cteTestSuiteAndChildren.id
)
SELECT 
	'test_suite_name', 
	'entity_id', 'entity_name', 'entity_type_name', 'entity_parent_id',
	'entity_description', 'entity_last_tested_date', 'entity_last_tested_time' ,
	'entity_test_name', 'entity_test_description', 'test_category', 'test_category_level',
	'initial_value', 'expecteTestSuiteAndChildrend_value', 'received_value', 'insert_value', 'failure_halts_test', 'entity_test_parent', 
	'run_by', 'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes' 
UNION ALL
SELECT 
	ts.test_suite_name, 
	et.id, et.entity_name, et.entity_type_entity_type_name, et.entity_parent,
	ed.description, ed.last_tested_date, ed.last_tested_time,
	tst.entity_test_name, tst.description, cat.entity_test_category_name, has_tst_cat.category_level,
	tst.initial_value, tst.expected_value, tst.received_value, tst.insert_value, tst.failure_halts_test, tst.entity_test_parent, 
	'SB_1', 'NR','','', '' 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\exported_data\\test_cases.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM test_bench.test_suite ts
INNER JOIN test_suite_has_entity_test ts_has_test ON ts.id = ts_has_test.test_suite_id
INNER JOIN entity_test tst 	ON  tst.id = ts_has_test.entity_test_id 
INNER JOIN entity_test_has_one_or_more_test_categories has_tst_cat ON has_tst_cat.entity_test_id = tst.id
INNER JOIN entity_test_category cat ON cat.id = has_tst_cat.entity_test_category_id
INNER JOIN entity et ON tst.entity_id = et.id
INNER JOIN entity_details ed ON ed.id = et.entity_type_details_id
WHERE ts.id IN(SELECT id FROM cteTestSuiteAndChildren);