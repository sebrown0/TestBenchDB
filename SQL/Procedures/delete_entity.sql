CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_entity`(IN entityRowId INT UNSIGNED, IN entityId INT UNSIGNED)
BEGIN
	DECLARE versionId INT UNSIGNED;
    DECLARE actionId INT UNSIGNED;
    
    SELECT 		ver.id 
    INTO 		versionId 
    FROM 		version ver
    INNER JOIN 	entity_has_version has_ver
			ON 	has_ver.version_id = ver.id
    WHERE 		has_ver.entity_id = entityRowId AND has_ver.entity_entity_id = entityRowId;
    
    SELECT 		act.id
    INTO 		actionId 
    FROM 		entity_can_have_action has_act
    INNER JOIN 	entity_action act
			ON 	has_act.entity_action_id = act.id
    WHERE 		has_act.entity_id = entityRowId AND has_act.entity_entity_id = entityRowId;
    
	DELETE FROM entity_has_version WHERE version_id = versionId;
    DELETE FROM version WHERE id = versionId;    
    DELETE FROM entity_todo WHERE entity_id = entityRowId AND entity_entity_id = entityId;    
    DELETE FROM entity_details WHERE id = entityRowId AND entity_id = entityId;    
    DELETE FROM entity_help WHERE id = entityRowId AND entity_id = entityId;
    DELETE FROM entity_can_have_action WHERE entity_action_id = actionId;   
    DELETE FROM entity_action WHERE id = actionId;   
    DELETE FROM entity WHERE id = entityRowId AND entity_id = entityId;    
END