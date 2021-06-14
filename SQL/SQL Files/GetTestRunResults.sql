SET @TEST_RUN_ID_FOR_THIS_QUERY = 7;
SELECT 
	tr.id AS "Test Run ID", tr.test_run_name AS "Test Run Name", tr.comments AS "Comments",
    run_res.test_run_run_by_employee_id AS "Run By", run_res.result_timestamp AS "Run On", run_res.number_test_cases_run AS "Num Run", 
    run_res.number_failures AS "Failed", run_res.number_passed AS "Passed", run_res.number_qualified_passes	 AS "Qualified Passes", run_res.number_ignored AS "Ignored", run_res.comments AS "Result comments"
FROM test_run tr
INNER JOIN test_run_result run_res
		ON run_res.test_run_id = tr.id
WHERE tr.id = @TEST_RUN_ID_FOR_THIS_QUERY;

CALL get_test_run_report(@TEST_RUN_ID_FOR_THIS_QUERY);
CALL get_latest_test_run_report(@TEST_RUN_ID_FOR_THIS_QUERY);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'FAIL',1);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'QP',0);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'NR',0);
CALL get_test_results_for_run_by_category(@TEST_RUN_ID_FOR_THIS_QUERY,'PASS',0);

SELECT * FROM test_bench.test_run_result;

/* GET THE CATEGORIES IF WE'RE GOING TO USE THEM IN TEST FORM*/
SELECT 		DISTINCT test.entity_test_name,
			cat.*
FROM 		entity_test_has_one_or_more_test_categories
			tst_has_cat
INNER JOIN	entity_test 
			test
		ON	test.id = tst_has_cat.entity_test_id
INNER JOIN	entity_test_category cat
		ON cat.id = tst_has_cat.entity_test_category_id
ORDER BY	test.entity_test_name;

SELECT 		test.entity_test_name AS 'Test Name', test.description AS 'Test Description', test.test_function AS 'Test Function', 
			test.data_in AS 'Data In', test.data_out AS 'Data Out', test.data_expected AS 'Data Expected', 
			concat (test.last_run_date, test.last_run_time) AS 'Last Run',  
			test_res.test_passed AS 'Result', test_res.fail_severity AS 'Fail Severity', 
			test_res.fail_reason AS 'Fail Reason', test_res.comments AS 'Comments'				
FROM 		test_run_result 
			run_res
INNER JOIN	entity_test_result 
			test_res
		ON 	test_res.test_run_result_id = run_res.id AND test_res.test_run_result_test_run_id = run_res.test_run_id	
INNER JOIN 	entity_test
			test
	ON		test.id = test_res.entity_test_id			
WHERE 		run_res.id = get_max_test_run_result_id_for_tr(4) AND test_res.test_passed = 'Fail';