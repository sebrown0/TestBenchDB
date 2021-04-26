WITH RECURSIVE cteTestSuitesInTestRun (test_suite_id) AS (
  SELECT     ts.test_suite_id
  FROM       test_run tr
  INNER JOIN test_run_has_test_suite has
		  ON tr.id = has.test_run_id
  INNER JOIN test_suite ts
		  ON ts.test_suite_id = has.test_suite_id
  WHERE      tr.id = 1
  UNION ALL
  SELECT     t.test_suite_id			 
  FROM       test_suite t
  INNER JOIN cteTestSuitesInTestRun
		  ON t.test_suite_parent_id = cteTestSuitesInTestRun.test_suite_id
)
SELECT 
	'test_suite_id', 
    'entity_test_id', 'entity_test_parent', 'entity_test_name', 'entity_test_description', 
    'entity_id', 'entity_name', 'entity_type_name',
	'entity_description', 'entity_last_tested_date', 'entity_last_tested_time',	
	'initial_value', 'expected_value', 'received_value', 'insert_value', 'failure_halts_test',
	'run_by', 'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes' 
UNION ALL
(
SELECT DISTINCT(cteTestSuitesInTestRun.test_suite_id), 
    tst.entity_test_id, tst.entity_test_parent, tst.entity_test_name, tst.description, 
	et.entity_id, et.entity_name, et.entity_type_entity_type_name,
	ed.description, ed.last_tested_date, ed.last_tested_time,	
	tst.initial_value, tst.expected_value, tst.received_value, tst.insert_value, tst.failure_halts_test,
    'SB_1', 'NR','','', '' 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\exported_data\\test_cases.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM 	   
	cteTestSuitesInTestRun
INNER JOIN test_suite_has_entity_test has_test
		ON cteTestSuitesInTestRun.test_suite_id = has_test.test_suite_id        
INNER JOIN entity_test tst
		ON tst.entity_test_id = has_test.entity_test_id
INNER JOIN entity et 
		ON tst.entity_id = et.entity_id
INNER JOIN entity_details ed 
		ON ed.id = et.entity_type_details_id    
ORDER BY   
	tst.entity_test_id, tst.entity_test_parent, cteTestSuitesInTestRun.test_suite_id, et.entity_id);