CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_test_suite`(
	IN id INT UNSIGNED, 
	IN testSuiteId INT UNSIGNED, 
	IN testSuiteName VARCHAR(250), 
    IN testSuiteNotes TEXT,
	IN parentId INT UNSIGNED,
    IN testSuiteParentId INT UNSIGNED,
    IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'))
BEGIN    	
    -- Create the version.
    CALL add_version(testSuiteId, testSuiteName, 'TEST_SUITE', get_max_ver_for_test_suite(testSuiteId), newVerCat,  @nextVersionId);

    -- Create the test suite
    -- With the latest version id of the parent.
    SET foreign_key_checks = 0;
    
    INSERT INTO `test_bench`.`test_suite_has_version` 
		(`version_id`, `test_suite_id`, `test_suite_test_suite_id`) 
    VALUES 
		(@nextVersionId, id, testSuiteId);
    
	INSERT INTO 
		`test_bench`.`test_suite` (`id`, `test_suite_id`, `test_suite_name`, `test_suite_notes`, `parent_id`, `parent_test_suite_id`) 
	VALUES 
		(id, testSuiteId, testSuiteName, testSuiteNotes, parentId, testSuiteParentId);
    
	SET foreign_key_checks = 1;    
END