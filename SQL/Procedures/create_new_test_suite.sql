CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_test_suite`(
	IN id INT UNSIGNED, 
	IN testSuiteId INT UNSIGNED, 
	IN testSuiteName VARCHAR(500), 
    IN testSuiteNotes TEXT,
	IN parentId INT UNSIGNED,
    IN testSuiteParentId INT UNSIGNED,    
    IN transGroupNumber INT UNSIGNED)
BEGIN    	
    DECLARE logMsg VARCHAR(1000);
        
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SET logMsg = concat("Unable to create new test suite [", id, ", ", testSuiteId, ", ", testSuiteName, "]");
		CALL new_log_entry("ERROR", logMsg, "create_new_test_suite", transGroupNumber);
    END;
        
	-- If it exists or it's an existing element we don't create.
	IF NOT test_suite_exists(id) AND NOT test_suite_exists_as_element(id) THEN
		-- Create the version.
		CALL add_version(testSuiteId, testSuiteName, 'TEST_SUITE', get_max_ver_for_test_suite(testSuiteId), 'MAJOR',  @nextVersionId);  		

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
        SET logMsg = concat("Created new test suite [", id, ", ", testSuiteId, ", ", testSuiteName, "]");
	ELSE	
		SET logMsg = concat("Test suite exists [", id, ", ", testSuiteId, ", ", testSuiteName, "]");
	END IF;
    
	CALL new_log_entry("INFO", logMsg, "create_new_test_suite", transGroupNumber);
END