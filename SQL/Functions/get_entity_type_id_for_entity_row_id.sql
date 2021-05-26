CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_type_id_for_entity_row_id`(entityRowId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE entityTypeId INT;
    
    SELECT 	entity_type_id 
    INTO 	entityTypeId 
    FROM 	entity 
    WHERE 	id = entityRowId;    
    
	RETURN 	entityTypeId;
END