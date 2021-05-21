CREATE DEFINER=`root`@`localhost` FUNCTION `get_element_id`(
	entityRowId INT UNSIGNED, 
    entityId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE elmntId INT UNSIGNED;
    
    SELECT 	id 
    INTO 	elmntId 
    FROM 	test_bench.element 
    WHERE 	entity_row_id = entityRowId AND entity_id = entityId;
    
	RETURN elmntId;
END