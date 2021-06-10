CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_action`(		
    IN entityRowId INT UNSIGNED,     	
    IN entityEntityId INT UNSIGNED,
    IN entityActionTypeId INT UNSIGNED,
    IN entityActionDesc VARCHAR(1000), 
    IN entityActionFunc VARCHAR(250), 
    IN entityActionDataIn TEXT,
    IN entityActionDataOut TEXT,
    IN entityActionDataExpected TEXT)
BEGIN
	DECLARE actId INT UNSIGNED;
    
    -- Only update or insert an action for a valid action type.
    IF is_valid_entity_action(entityActionTypeId) THEN
		SET actId = get_entity_action_id(entityRowId, entityEntityId);
		IF actId IS NULL OR actId <= 0 THEN
			SET actId = get_next_entity_action_id();			
		END IF;
		
		INSERT INTO `test_bench`.`entity_action` 			(
			`id`, `entity_id`, `entity_action_desc`, `entity_action_function`, 
            `entity_action_data_in`, `entity_action_data_out`, `entity_action_data_expected`, `entity_action_type_id`) 
		VALUES (
			actId, entityRowId, entityActionDesc, entityActionFunc, 
            entityActionDataIn, entityActionDataOut, entityActionDataExpected, entityActionTypeId)	
		ON DUPLICATE KEY UPDATE
			entity_action_desc = entityActionDesc, 
            entity_action_function = entityActionFunc,            
			entity_action_data_in = entityActionDataIn, 
            entity_action_data_out = entityActionDataOut,
            entity_action_data_expected = entityActionDataExpected,
			entity_action_type_id = entityActionTypeId;
            
		INSERT INTO 
			`test_bench`.`entity_can_have_action` (`entity_action_id`, `entity_id`, `entity_entity_id`) 
		VALUES 
			(actId, entityRowId, entityEntityId)
		ON DUPLICATE KEY UPDATE
			entity_id = entityRowId,
            entity_entity_id = entityEntityId;				
	END IF;
END