CREATE DEFINER=`root`@`localhost` PROCEDURE `add_or_update_test_run`(
	IN testRunIdIn INT UNSIGNED,
	IN testRunName VARCHAR(100),
    IN cmnts VARCHAR(1000),
    IN testSuiteId INT UNSIGNED,
    IN testSuiteVersionId INT UNSIGNED)
BEGIN
	
    IF test_run_exists(testRunIdIn) THEN
		IF test_run_has_test_suite(testRunIdIn, testSuiteId, testSuiteVersionId) THEN	
			CALL update_test_run(testRunIdIn, testRunName, cmnts, testSuiteId, testSuiteVersionId);
		ELSE
			CALL add_test_suite_to_test_run(testRunIdIn, testSuiteId, testSuiteVersionId);            
        END IF;
	ELSE
		CALL add_test_run(testRunIdIn, testRunName, cmnts, testSuiteId, testSuiteVersionId);
    END IF;
    
END