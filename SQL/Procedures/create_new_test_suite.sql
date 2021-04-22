CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_test_suite`(
	IN testSuiteId INT UNSIGNED, 
	IN testSuiteName VARCHAR(100), 
	IN testSuiteParentId INT UNSIGNED)
BEGIN    
	CALL create_new_initial_version(testSuiteName, "TEST_SUITE", @nextVersionId);   
    
    -- Create the has version
    INSERT INTO 
		`test_bench`.`test_suite_has_version` (`test_suite_id`, `version_id`) 
	VALUES 
		(testSuiteId, @nextVersionId);
	
    -- Create the test suite
    INSERT INTO 
		`test_bench`.`test_suite` (`id`, `test_suite_name`, `test_suite_parent_id`) 
	VALUES 
		(testSuiteId, testSuiteName, testSuiteParentId);    
END