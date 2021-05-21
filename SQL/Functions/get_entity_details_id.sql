CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_details_id`(
	entityRowId INT UNSIGNED,     	
    entityEntityId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE detId INT;    
    
    SELECT 		entity_details_id 
    INTO 		detId
	FROM 		entity
	WHERE 		id = entityRowId  AND entity_id = entityEntityId;     
    
	RETURN detId;
END