CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_details_id_for_entity`(
	entityRowId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE detId INT UNSIGNED;
    
	SELECT 	id 
    INTO	detId 
    FROM 	entity_details 
    WHERE 	entity_id = entityRowId;
    
	RETURN 	detId;
END