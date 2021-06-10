CREATE DEFINER=`root`@`localhost` PROCEDURE `update_test_run_report_as_run`(
	IN testRunId INT UNSIGNED, 
    IN testResultId INT UNSIGNED,
    IN reportFilename VARCHAR(300))
BEGIN
	UPDATE 	test_run_result
	SET 	report_issued = 1,
			report_issued_date = now(),
			report_filename = reportFilename
	WHERE	id = testResultId
	AND 	test_run_id = testRunId;
END