CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_run`(
	IN testRunId INT UNSIGNED,
	IN testRunName VARCHAR(100),
    IN cmnts VARCHAR(1000),
    IN testSuiteId INT UNSIGNED,
    IN testSuiteRowId INT UNSIGNED)
BEGIN
	INSERT INTO 
		`test_bench`.`test_run` (`id`, `test_run_name`, `comments`) 
	VALUES 
		(testRunId, testRunName, cmnts);
        
	CALL add_test_suite_to_test_run(testRunId, testSuiteRowId, testSuiteId);
END