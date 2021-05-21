CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_as_element`(
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED,
    IN isElement TINYINT)
BEGIN
	DECLARE elementId INT UNSIGNED;
        
    IF isElement THEN
		SELECT id INTO elementId FROM element WHERE entity_row_id = entityRowId AND entity_id = entityId;
			
		INSERT INTO 
			`test_bench`.`element` (`id`, `entity_row_id`, `entity_id`) 
		VALUES 
			(elementId, entityRowId, entityId)
		ON DUPLICATE KEY UPDATE
			entity_row_id = entityRowId,
			entity_id = entityId;				
	END IF;
END