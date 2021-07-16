CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity_test_case`(
	IN id INT UNSIGNED, IN entityTestId INT UNSIGNED, IN entityId INT UNSIGNED, IN entityEntityId INT UNSIGNED, 
	IN entityTestName VARCHAR(500), IN createdByEmployeeId VARCHAR(45), IN entityTestDesc VARCHAR(1000), 
    IN testFunction VARCHAR(1000), IN dataIn VARCHAR(1000), IN dataOut VARCHAR(1000), IN dataExpected VARCHAR(1000), 
    IN failureHaltsTest TINYINT, IN primaryTestCat VARCHAR(1000), IN secondaryTestCat VARCHAR(1000),
    IN testCreated DATE, IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'), 
    IN parentId INT UNSIGNED, IN parentEntityTestId INT UNSIGNED,
    IN lastRunDate DATE, IN lastRunTime TIME,
    IN transGroupNumber INT UNSIGNED)
BEGIN   
    DECLARE noExisting INT UNSIGNED;
	DECLARE hasParent TINYINT;
    DECLARE logMsg VARCHAR(1000);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SET logMsg = concat("Unable to create new test case [", id, ", ", entityTestId, ", ", entityTestName, "]");
		CALL new_log_entry("ERROR", logMsg, "create_new_entity_test_case", transGroupNumber);
    END;
    
    -- If it's an existing test or element we don't add it.
	IF NOT test_case_exists(id) AND NOT test_case_exists_as_element(id) THEN
		-- Create the entity test    
		SET FOREIGN_KEY_CHECKS=0;
		INSERT INTO  
			`test_bench`.`entity_test` ( 
			`id`, `entity_test_id`, `entity_id`, `entity_entity_id`, `entity_test_name`, `description`, `created_on`, 
			`test_function`, `data_in`, `data_out`, `data_expected`, 
			`failure_halts_test`, `created_by_employee_id`, `last_run_date`, `last_run_time`, `parent_test_row_id`, `parent_test_id`) 
		VALUES 	(
			id, entityTestId, entityId, entityEntityId, entityTestName, entityTestDesc, testCreated, 
			testFunction, dataIn, dataOut, dataExpected, 
			failureHaltsTest, createdByEmployeeId, lastRunDate, lastRunTime, parentId, parentEntityTestId)
		ON DUPLICATE KEY UPDATE
			description = entityTestDesc,
			test_function = testFunction,
			data_in = dataIn,
			data_out = dataOut,
			data_expected = data_expected,
			failure_halts_test = failureHaltsTest,
			last_run_date = lastRunDate,
			last_run_time = lastRunTime;
			
		IF parentId > 0 AND test_suite_exists(parentId) THEN
			INSERT INTO `test_bench`.`test_suite_has_entity_test` (
				`test_suite_row_id`, `test_suite_id`, `entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) 
			VALUES (
				parentId, parentEntityTestId, id, entityTestId, entityId, entityEntityId);
		ELSEIF parentId IS NULL OR parentId = 0 THEN
			INSERT INTO `test_bench`.`test_suite_has_entity_test` (
				`test_suite_row_id`, `test_suite_id`, `entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) 
			VALUES (
				id, entityTestId, id, entityTestId, entityId, entityEntityId);
		END IF;
		SET FOREIGN_KEY_CHECKS=1;
		
		-- Create the version 
		CALL add_version(entityTestId, entityTestName, 'TEST', get_max_ver_for_entity_test(entityTestId), newVerCat,  @nextVersionId);    
		
		-- Create the has version    
		INSERT INTO `test_bench`.`entity_test_has_version` 
			(`version_id`, `entity_test_id`, `entity_test_entity_test_id`) 
		VALUES 
			(@nextVersionId, id, entityTestId);
			
		-- Add category(s) for TC
		CALL add_categories_for_entity_test(primaryTestCat, secondaryTestCat, id, entityTestId);		
        SET logMsg = concat("Created new test case [", id, ", ", entityTestId, ", ", entityTestName, "]");		
	ELSE	
		SET logMsg = concat("Test case exists [", id, ", ", entityTestId, ", ", entityTestName, "]");		
    END IF;
    CALL new_log_entry("INFO", logMsg, "create_new_entity_test_case", transGroupNumber);
END