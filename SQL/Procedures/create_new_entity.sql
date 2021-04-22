CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity`(
	IN entityId INT UNSIGNED, 
	IN entityName VARCHAR(100), 
	IN entityTypeName VARCHAR(45), 
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    IN entityParent INT UNSIGNED)
BEGIN
    
    -- Create the details
	CALL create_entity_details(entityDesc, creationType, @nextDetailsId);
    
    -- Create the version
    CALL create_new_initial_version(entityName, "Entity", @nextVersionId); -- Perform check onn entityTypeName? TODO
    
    SET foreign_key_checks = 0;
    
    -- Create the has version
    INSERT INTO 
		`test_bench`.`entity_has_version` (`entity_id`, `entity_entity_version_id`, `version_id`) 
	VALUES 
		(entityId, @nextVersionId, @nextVersionId);    
    
    -- Create the entity
    INSERT INTO 
		`test_bench`.`entity` (`id`, `entity_version_id`, `entity_name`, `entity_type_details_id`, `entity_type_id`, `entity_type_entity_type_name`, `entity_parent`) 
	VALUES 
		(entityId, @nextVersionId, entityName, @nextDetailsId, get_entity_type_id_for_name(entityTypeName), entityTypeName, entityParent);

	SET foreign_key_checks = 1;
END