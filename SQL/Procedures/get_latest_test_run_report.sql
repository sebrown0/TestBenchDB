CREATE DEFINER=`root`@`localhost` PROCEDURE `get_latest_test_run_report`(IN testRunId INT UNSIGNED)
BEGIN

	SELECT 		tr.id AS "Test Run ID", run_res.id AS 'Test Run Result ID', tr.test_run_name AS "Test Run Name", tr.comments AS "Comments",			
				run_res.test_run_run_by_employee_id AS "Run By", run_res.result_timestamp AS "Run On", run_res.number_test_cases_run AS "Num Run", 
				run_res.number_failures AS "Failed", run_res.number_passed AS "Passed", 
                run_res.number_qualified_passes	 AS "Qualified Passes", run_res.number_ignored AS "Ignored", run_res.comments AS "Result comments",
                run_res.report_issued AS "Report Issued", run_res.report_issued_date AS "Issued On", run_res.report_filename AS "Report File Name"
	FROM 		test_run tr
	INNER JOIN 	test_run_result run_res
			ON 	run_res.test_run_id = tr.id
	WHERE 		tr.id = testRunId
    AND			run_res.id = get_max_test_run_result_id_for_tr(testRunId) ;
END