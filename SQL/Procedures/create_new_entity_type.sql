CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity_type`(
	IN entTypeId INT UNSIGNED,
    IN entityTypeName VARCHAR(250), 
    IN entityTypeParentId INT UNSIGNED,
    IN hasChildren VARCHAR(300),
    IN assignDefaultFailReasons TINYINT)
BEGIN
	    
	INSERT INTO `test_bench`.`entity_type` 
		(`id`, `entity_type_name`, `entity_type_parent_id`, `has_children`) 
    VALUES 
		(entTypeId, entityTypeName, entityTypeParentId, hasChildren);

	INSERT INTO `test_bench`.`entity_type_has_child` 
		(`parent_entity_type_id`, `entity_type_parent_name`, `child_entity_type_id`, `entity_type_child_name` ) 
	VALUES 
		(entityTypeParentId, (SELECT entity_type_name FROM entity_type WHERE id = entityTypeParentId), entTypeId, entityTypeName);

	IF assignDefaultFailReasons = TRUE THEN
		CALL add_default_entity_type_has_fail_reason(entTypeId, entityTypeName); 
    END IF;
END