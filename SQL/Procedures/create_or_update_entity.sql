CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity`(
	IN id INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
	IN entityName VARCHAR(100), 
    IN entityDetailsId INT UNSIGNED, 
	IN entityTypeName VARCHAR(45), 
    IN entityHelpId INT UNSIGNED, 
    IN entityParentId INT UNSIGNED,
    IN entityParentEntityId INT UNSIGNED,
	IN isElement TINYINT)
BEGIN
	DECLARE entityTypeId INT;
        
    SET foreign_key_checks = 0;     
    SET entityTypeId = get_entity_type_id_for_name(entityTypeName);

    INSERT INTO `test_bench`.`entity` (
		`id`, `entity_id`, `entity_name`, `entity_details_id`, `entity_type_id`, `entity_type_entity_type_name`, `entity_help_id`, 
        `parent_id`, `parent_entity_id`, `is_element`)
    VALUES 	(
		id, entityId, entityName, entityDetailsId, entityTypeId, entityTypeName, entityHelpId, 
        entityParentId, entityParentEntityId, isElement)
    ON DUPLICATE KEY UPDATE
		entity_name = entityName, 
        entity_details_id = entityDetailsId, 
        entity_type_id = entityTypeId, 
        entity_type_entity_type_name = entityTypeName, 
        entity_help_id = entityHelpId, 
        parent_id = entityParentId, 
        parent_entity_id = entityParentEntityId,
        is_element = isElement;        
	
	SET foreign_key_checks = 1;
    
    CALL create_or_update_entity_as_element(id, entityId, isElement);
END