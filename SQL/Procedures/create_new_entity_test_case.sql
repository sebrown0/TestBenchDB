CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity_test_case`(
	IN entityTestId INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
	IN entityTestName VARCHAR(200), 
	IN createdByEmployeeId VARCHAR(45), 
    IN entityTestParent INT UNSIGNED,
    IN entityTestDesc VARCHAR(1000), 
    IN initialValue VARCHAR(1000), 
    IN expectedValue VARCHAR(1000), 
    IN receivedValue VARCHAR(1000), 
    IN insertValue VARCHAR(1000), 
    IN failureHaltsTest TINYINT,
    IN testCreated DATE)
BEGIN    
    
    -- Create the version 
    CALL create_new_initial_version(entityTestName, "Test", @nextVersionId);   
    
    -- Create the has version
    INSERT INTO 
		`test_bench`.`entity_test_has_version` (`entity_test_id`, `entity_test_entity_id`, `entity_test_entity_test_version_id`, `version_id`)
    VALUES 
		(entityTestId, entityId,  @nextVersionId,  @nextVersionId);
    
    -- Create the entity test
    INSERT INTO 
		`test_bench`.`entity_test` (
			`id`, `entity_id`, `entity_test_version_id`, `entity_test_name`, `description`, `created_on`, 
            `initial_value`, `expected_value`, `received_value`, `insert_value`, 
            `failure_halts_test`, `created_by_employee_id`, `entity_test_parent`) 
	VALUES 
		(
			entityTestId, entityId, @nextVersionId, entityTestName, entityTestDesc, testCreated, 
            initialValue, expectedValue, receivedValue, insertValue, 
            failureHaltsTest, createdByEmployeeId, entityTestParent
		);
        	
	-- Add this test case to the test suite
	INSERT INTO 
		`test_bench`.`test_suite_has_entity_test` (`test_suite_id`, `entity_test_id`, `entity_test_entity_id`, `entity_test_entity_test_version_id`)
	VALUES 
		(entityTestParent, entityTestId, entityId, @nextVersionId);
END