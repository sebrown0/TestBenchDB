CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_test_suite`(
	IN testSuiteId INT UNSIGNED, 
	IN testSuiteName VARCHAR(100), 
	IN testSuiteParentId INT UNSIGNED,
    IN testSuiteNotes TEXT,
    IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'))
BEGIN    	
    -- Create the version.
    CALL add_version(testSuiteId, testSuiteName, 'TEST_SUITE', get_max_ver_for_test_suite(testSuiteId), newVerCat,  @nextVersionId);

    -- Create the test suite
    -- With the latest version id of the parent.
    SET foreign_key_checks = 0;
    INSERT INTO 
		`test_bench`.`test_suite` (`test_suite_id`, `test_suite_version_id`, `test_suite_name`, `test_suite_notes`, `test_suite_parent_id`, `test_suite_parent_version_id`) 
	VALUES 
		(testSuiteId, @nextVersionId, testSuiteName, testSuiteNotes, testSuiteParentId, get_ver_id_from_test_suite(testSuiteParentId));
    
	SET foreign_key_checks = 1;
    
	-- Create the has version.
    INSERT INTO 
		`test_bench`.`test_suite_has_version` (`test_suite_id`, `version_id`) 
	VALUES 
		(testSuiteId, @nextVersionId);	
END