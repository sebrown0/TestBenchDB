CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_suite_to_test_run`(
	IN testRunId INT UNSIGNED,	
    IN testSuiteId INT UNSIGNED,
    IN testSuiteVersionId INT UNSIGNED)
BEGIN	
	INSERT INTO  
		`test_bench`.`test_run_has_test_suite` (`test_run_id`, `test_suite_id`, `test_suite_version_id`) 
	VALUES 
		(testRunId, testSuiteId, testSuiteVersionId);
END