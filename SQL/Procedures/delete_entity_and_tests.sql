CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_entity_and_tests`(IN entityRowId INT UNSIGNED, IN entityId INT UNSIGNED)
BEGIN
	DECLARE entityVersionId INT UNSIGNED;
    DECLARE entityTestVersionId INT UNSIGNED;
    DECLARE actionId INT UNSIGNED;
    DECLARE entityTestRowId INT UNSIGNED;
    DECLARE entityTestId INT UNSIGNED;
    
    SELECT 		id, entity_test_id 
    INTO		entityTestRowId, entityTestId
    FROM 		entity_test 
    WHERE 		entity_id = entityRowId AND entity_entity_id = entityId;
    
    SELECT 		ver.id 
    INTO 		entityVersionId 
    FROM 		version ver
    INNER JOIN 	entity_has_version has_ver
			ON 	has_ver.version_id = ver.id
    WHERE 		has_ver.entity_id = entityRowId AND has_ver.entity_entity_id = entityRowId;
    
    SELECT 		ver.id 
    INTO 		entityTestVersionId 
    FROM 		version ver
    INNER JOIN 	entity_test_has_version has_ver
			ON 	has_ver.version_id = ver.id
    WHERE 		has_ver.entity_test_id = entityRowId AND has_ver.entity_test_entity_test_id = entityRowId;
    
    SELECT 		act.id
    INTO 		actionId 
    FROM 		entity_can_have_action has_act
    INNER JOIN 	entity_action act
			ON 	has_act.entity_action_id = act.id
    WHERE 		has_act.entity_id = entityRowId AND has_act.entity_entity_id = entityRowId;
    
    DELETE FROM  test_suite_has_entity_test 
    WHERE entity_test_id = entityTestRowId AND entity_test_entity_test_id = entityTestId AND entity_test_entity_id = entityRowId;    
    DELETE FROM entity_test_has_one_or_more_test_categories 
	WHERE entity_test_id = entityTestRowId AND entity_test_entity_test_id = entityTestId;    
    DELETE FROM entity_test_has_version WHERE version_id = entityTestVersionId;
    DELETE FROM version WHERE id = entityTestVersionId;        
    DELETE FROM entity_test_result WHERE entity_test_entity_id = entityRowId AND entity_test_entity_entity_id = entityId;    
    DELETE FROM entity_test WHERE entity_id = entityRowId AND entity_entity_id = entityId;    
        
	DELETE FROM entity_has_version WHERE version_id = entityVersionId;
    DELETE FROM version WHERE id = entityVersionId;    
    DELETE FROM entity_todo WHERE entity_id = entityRowId AND entity_entity_id = entityId;    
    DELETE FROM entity_details WHERE id = entityRowId AND entity_id = entityId;    
    DELETE FROM entity_help WHERE id = entityRowId AND entity_id = entityId;
    DELETE FROM entity_can_have_action WHERE entity_action_id = actionId;   
    DELETE FROM entity_action WHERE id = actionId;   
    DELETE FROM entity WHERE id = entityRowId AND entity_id = entityId;    

END