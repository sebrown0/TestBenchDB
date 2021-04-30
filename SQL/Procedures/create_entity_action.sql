CREATE DEFINER=`root`@`localhost` PROCEDURE `create_entity_action`(
	IN entityId INT UNSIGNED, 
    IN entityActionType INT UNSIGNED,
    IN entityActionDesc VARCHAR(500), 
    IN entityActionData VARCHAR(500))
BEGIN
	DECLARE entityActionId INT UNSIGNED;
    
	-- Create the entity action if applicable
    IF entityActionType > 0 THEN 
		INSERT INTO 
			`test_bench`.`entity_action` (`entity_action_type_id`, `entity_action_desc`, `entity_action_data`) 
		VALUES 
			(entityActionType, entityActionDesc, entityActionData);
            
		-- Get the ID of the record we just created.
		SELECT id INTO entityActionId FROM test_bench.entity_action ORDER BY id DESC LIMIT 1;
        
        -- Add the action to the list of the entity's actions.
        INSERT INTO 
			`test_bench`.`entity_can_have_action` (`entity_id`, `entity_version_id`, `entity_action_id`)
		VALUES
			(entityId, get_latest_version_id(entityId), entityActionId);            
    END IF;
END