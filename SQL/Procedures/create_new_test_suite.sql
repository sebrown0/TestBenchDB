CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_test_suite`(
	IN testSuiteId INT UNSIGNED, 
	IN testSuiteName VARCHAR(100), 
	IN testSuiteParentId INT UNSIGNED)
BEGIN    
    INSERT INTO 
		`test_bench`.`test_suite` (`id`, `test_suite_name`, `test_suite_parent_id`) 
	VALUES 
		(testSuiteId, testSuiteName, testSuiteParentId);    
END