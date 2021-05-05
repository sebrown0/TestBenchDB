SET @TEST_RUN_ID_FOR_THIS_QUERY = 2;
SELECT 
	tr.id AS "Test Run ID", tr.test_run_name AS "Test Run Name", tr.comments AS "Comments",
    run_res.test_run_run_by_employee_id AS "Run By", run_res.result_timestamp AS "Added", run_res.number_test_cases_run AS "Num Run", 
    run_res.number_failures AS "Num Failed", run_res.number_passed AS "Num Passed", run_res.number_ignored AS "Num Ignored", run_res.comments AS "Result comments"
FROM test_run tr
INNER JOIN test_run_result run_res
		ON run_res.test_run_id = tr.id
WHERE tr.id = @TEST_RUN_ID_FOR_THIS_QUERY;