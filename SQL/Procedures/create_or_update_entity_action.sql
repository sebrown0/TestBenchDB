CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_action`(		
    IN entityRowId INT UNSIGNED,     	
    IN entityEntityId INT UNSIGNED,
    IN entityActionTypeId INT UNSIGNED,
    IN entityActionDesc VARCHAR(500), 
    IN entityActionData VARCHAR(500))
BEGIN
	DECLARE actId INT UNSIGNED;
    
    -- Only update or insert an action for a valid action type.
    IF is_valid_entity_action(entityActionTypeId) THEN
		SET actId = get_entity_action_id(entityRowId, entityEntityId);
		IF actId IS NULL OR actId <= 0 THEN
			SET actId = get_next_entity_action_id();
			SET foreign_key_checks = 0;
			INSERT INTO 
				`test_bench`.`entity_can_have_action` (`entity_action_id`, `entity_id`, `entity_entity_id`) 
			VALUES 
				(actId, entityRowId, entityEntityId);		
			SET foreign_key_checks = 1;
		END IF;
		
		INSERT INTO 
			`test_bench`.`entity_action` (`id`, `entity_id`, `entity_action_desc`, `entity_action_data`, `entity_action_type_id`) 
		VALUES 
			(actId, entityRowId, entityActionDesc, entityActionData, entityActionTypeId)	
		ON DUPLICATE KEY UPDATE
			entity_action_desc = entityActionDesc, 
			entity_action_data = entityActionData, 
			entity_action_type_id = entityActionTypeId;
	END IF;
END