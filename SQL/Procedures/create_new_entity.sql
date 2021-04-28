CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity`(
	IN entityId INT UNSIGNED, 
	IN entityName VARCHAR(100), 
	IN entityTypeName VARCHAR(45), 
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    IN entityParent INT UNSIGNED,
    IN verType ENUM('MAJOR','MINOR','BUILD'))
BEGIN
	DECLARE entityTypeId INT;
    
    SET entityTypeId = get_entity_type_id_for_name(entityTypeName);
    -- Create the version 
     CALL add_version(entityId, entityName, 'Entity', verType, get_max_ver_for_entity(entityId),  @nextVersionId);       
    
    -- Create the details
	CALL create_entity_details(entityDesc, creationType, @nextDetailsId);        
    
    -- Create the entity
    SET foreign_key_checks = 0;
    INSERT INTO 
		`test_bench`.`entity` (`entity_id`, `entity_version_id`, `entity_name`, `entity_type_details_id`, `entity_type_id`, `entity_type_entity_type_name`, `entity_parent`) 
	VALUES 
		(entityId, @nextVersionId, entityName, @nextDetailsId, entityTypeId, entityTypeName, entityParent);
	SET foreign_key_checks = 1;
    
    -- Create the has version
    INSERT INTO 
		`test_bench`.`entity_has_version` (`entity_version_id`, `version_id`) 
	VALUES 
		(entityId, @nextVersionId); 
    
END