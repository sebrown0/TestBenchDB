CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_help_id`(
	entityRowId INT UNSIGNED,     	
    entityEntityId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE helpId INT;    
    
    SELECT 		entity_help_id 
    INTO 		helpId
	FROM 		entity
	WHERE 		id = entityRowId  AND entity_id = entityEntityId;     
        
	RETURN helpId;
END