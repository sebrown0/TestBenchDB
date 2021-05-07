CREATE DEFINER=`root`@`localhost` PROCEDURE `create_entity_action`(
	IN entityId INT UNSIGNED, 
    IN entityEntityId INT UNSIGNED, 
    IN entityActionTypeId INT UNSIGNED,
    IN entityActionDesc VARCHAR(500), 
    IN entityActionData VARCHAR(500))
BEGIN
	DECLARE entityActionId INT UNSIGNED;
    
	-- Create the entity action if applicable
    IF entityActionTypeId > 0 THEN 
		INSERT INTO 
			`test_bench`.`entity_action` (`entity_action_desc`, `entity_action_data`, `entity_action_type_id`) 
		VALUES 
			(entityActionDesc, entityActionData, entityActionTypeId);
        
		-- Get the ID of the record we just created.
		SELECT id INTO entityActionId FROM test_bench.entity_action ORDER BY id DESC LIMIT 1;
        
        -- Add the action to the list of the entity's actions. 
        INSERT INTO 
			`test_bench`.`entity_can_have_action` (`entity_action_id`, `entity_id`, `entity_entity_id`) 
		VALUES 
			(entityActionId, entityId, entityEntityId);
            
    END IF;
END