CREATE DEFINER=`root`@`localhost` PROCEDURE `add_or_update_test_run`(
	IN testRunIdIn INT UNSIGNED,
	IN testRunName VARCHAR(100),
    IN cmnts VARCHAR(1000),
    IN testSuiteRowId INT UNSIGNED,
    IN testSuiteId INT UNSIGNED)
BEGIN	
    IF test_run_exists(testRunIdIn) THEN
		IF test_run_has_test_suite(testRunIdIn, testSuiteRowId, testSuiteId) THEN	
            CALL update_test_run(testRunIdIn, testRunName, cmnts);
		ELSE
			CALL add_test_suite_to_test_run(testRunIdIn, testSuiteRowId, testSuiteId);            
        END IF;
	ELSE
		CALL add_test_run(testRunIdIn, testRunName, cmnts, testSuiteRowId, testSuiteId);
    END IF;    
END