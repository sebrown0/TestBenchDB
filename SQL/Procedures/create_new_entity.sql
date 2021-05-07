CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity`(
	IN id INT UNSIGNED, 
	IN entityId INT UNSIGNED, 
	IN entityName VARCHAR(100), 
	IN entityTypeName VARCHAR(45), 
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    IN entityParentId INT UNSIGNED,
    IN entityParentEntityId INT UNSIGNED,
    IN shouldHaveToolTip VARCHAR(5),
	IN toolTipText VARCHAR(500),
    IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'))
BEGIN
	DECLARE entityTypeId INT;
    DECLARE entityHelpId INTEGER UNSIGNED;
    
    SET entityTypeId = get_entity_type_id_for_name(entityTypeName);
    
    -- Create the version 
     CALL add_version(entityId, entityName, 'Entity', get_max_ver_for_entity(entityId), newVerCat,  @nextVersionId);       
    
    -- Create the details
	CALL create_entity_details(entityDesc, creationType, @nextDetailsId);        
    
    -- Create entity help
    CALL add_entity_help(shouldHaveToolTip , toolTipText, NULL, NULL, entityHelpId);
    
    -- Create the entity
    SET foreign_key_checks = 0; 
    INSERT INTO 
		`test_bench`.`entity_has_version` (`version_id`, `entity_id`, `entity_entity_id`) 
	VALUES 
		(@nextVersionId, id, entityId);
	INSERT INTO 
		`test_bench`.`entity` (`id`, `entity_id`, `entity_name`, `entity_type_details_id`, `entity_type_id`, `entity_type_entity_type_name`, `entity_help_id`, `parent_id`, `parent_entity_id`)
	VALUES 
		(id, entityId, entityName, @nextDetailsId, entityTypeId, entityTypeName, entityHelpId, entityParentId, entityParentEntityId);
    
	SET foreign_key_checks = 1;
END