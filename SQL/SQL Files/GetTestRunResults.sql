SELECT * FROM test_bench.entity_test_result;
SELECT * FROM test_bench.test_run_result;

SET @TEST_RUN_ID_FOR_THIS_QUERY = 9;

-- CALL get_test_run_report(@TEST_RUN_ID_FOR_THIS_QUERY);
CALL get_latest_test_run_report(@TEST_RUN_ID_FOR_THIS_QUERY);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'FAIL',0);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'QP',1);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'NR',0);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'PASS',0);


SELECT 		DISTINCT ts.test_suite_name AS 'In Test Suite', 
			test.entity_test_name AS 'Test Name', test.id AS 'Test ID', test.description AS 'Test Description', test.test_function AS 'Test Function', 
			test.data_in AS 'Data In', test.data_out AS 'Data Out', test.data_expected AS 'Data Expected', 
			concat (test.last_run_date, " - ", test.last_run_time) AS 'Last Run',  
			test_res.id AS 'Result ID', test_res.test_passed AS 'Result', test_res.fail_severity AS 'Fail Severity', 
			test_res.fail_reason AS 'Fail Reason', test_res.comments AS 'Comments',
			stat.id AS 'Issue Status Row ID', stat.phase AS 'Phase', stat.status_id AS 'Status Id', stat.status AS 'Status', 
			stat.status_description AS 'Status Description', stat.issue_status_id AS 'Next Status Id'
FROM 		test_run_result 
			run_res
INNER JOIN	entity_test_result 
			test_res
		ON 	test_res.test_run_result_test_run_id = run_res.test_run_id	                
INNER JOIN 	entity_test
			test
		ON	test.id = test_res.entity_test_id	
INNER JOIN 	test_suite_has_entity_test 
			ts_has_tst
		ON 	ts_has_tst.entity_test_id = test.id
INNER JOIN 	test_suite 
			ts
		ON 	ts.id = ts_has_tst.test_suite_row_id    
INNER JOIN	entity 
			ent 
		ON	ent.id = test.entity_id AND ent.entity_id = test.entity_entity_id
INNER JOIN	issue_status 
			stat
		ON	stat.id = ent.issue_status_id
WHERE 		run_res.id = get_max_test_run_result_id_for_tr(8) 
AND 		test_res.test_passed = 'QP' 
ORDER BY 	ts.test_suite_name,test_res.fail_severity, test.id;


