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
    IN primaryTestCat VARCHAR(1000),
    IN secondaryTestCat VARCHAR(1000),
    IN testCreated DATE,
    IN verType ENUM('MAJOR','MINOR','BUILD'))
BEGIN   
    -- Create the version 
    CALL add_version(entityTestId, entityTestName, 'TEST', verType, get_max_ver_for_entity_test(entityTestId),  @nextVersionId);        
    
    -- Create the entity test
    SET foreign_key_checks = 0;
    INSERT INTO 
		`test_bench`.`entity_test` (
			`entity_test_id`, `entity_id`, `entity_test_version_id`, `entity_test_name`, `description`, `created_on`, 
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
		`test_bench`.`test_suite_has_entity_test` (`test_suite_id`, `entity_test_id`) 
	VALUES 
		(entityTestParent, entityTestId);
        
	SET foreign_key_checks = 1;
	-- Create the has version
    INSERT INTO 
		`test_bench`.`entity_test_has_version` (`entity_test_id`, `version_id`)
    VALUES 
		(entityTestId, @nextVersionId); 
                	
	-- Add category(s) for TC
    CALL add_categories_for_entity_test(primaryTestCat, secondaryTestCat, entityTestId, entityId, @nextVersionId);

END