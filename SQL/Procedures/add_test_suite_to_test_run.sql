CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_suite_to_test_run`(
	IN testRunId INT UNSIGNED,	
    IN testSuiteRowId INT UNSIGNED,
    IN testSuiteId INT UNSIGNED)
BEGIN	

	INSERT INTO 
		`test_bench`.`test_run_has_test_suite` (`test_suite_id`, `test_suite_row_id`, `test_run_id`) 
	VALUES 
		(testSuiteId, testSuiteRowId, testRunId);
END