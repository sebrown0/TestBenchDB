CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_has_element`(
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED,
    IN hasElementEntityRowId INT UNSIGNED)
BEGIN
	DECLARE elementIdExistsInhasElementRowId INT UNSIGNED;
	DECLARE hasElementRowId INT UNSIGNED;    
    DECLARE hasElementEntityId INT UNSIGNED;

	IF hasElementEntityRowId > 0 THEN
		SELECT 	element_id 
		INTO 	elementIdExistsInhasElementRowId 
		FROM 	entity_has_element 
		WHERE 	entity_id = entityRowId AND entity_entity_id = entityId AND element_entity_row_id = hasElementEntityRowId;
		
		IF elementIdExistsInhasElementRowId IS NULL OR elementIdExistsInhasElementRowId <= 0 THEN        
			SELECT 	id, entity_id
			INTO 	hasElementRowId, hasElementEntityId
			FROM 	element 
			WHERE 	entity_row_id = hasElementEntityRowId; 

			INSERT INTO `test_bench`.`entity_has_element` (
				`entity_id`, `entity_entity_id`, `element_id`, `element_entity_row_id`, `element_entity_id`) 
			VALUES (
				entityRowId, entityId, hasElementRowId, hasElementEntityRowId, hasElementEntityId); 
		END IF;
	END IF;
END