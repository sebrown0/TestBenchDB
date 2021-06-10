CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_run_report`(IN testRunId INT UNSIGNED)
BEGIN

	SELECT 		tr.id AS "Test Run ID", tr.test_run_name AS "Test Run Name", tr.comments AS "Comments",
				run_res.test_run_run_by_employee_id AS "Run By", run_res.result_timestamp AS "Run On", run_res.number_test_cases_run AS "Num Run", 
				run_res.number_failures AS "Failed", run_res.number_passed AS "Passed", 
                run_res.number_qualified_passes	 AS "Qualified Passes", run_res.number_ignored AS "Ignored", run_res.comments AS "Result comments"
	FROM 		test_run tr
	INNER JOIN 	test_run_result run_res
			ON 	run_res.test_run_id = tr.id
	WHERE 		tr.id = testRunId;
END