CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_type_name_for_id`(entityTypeId INT UNSIGNED) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE n VARCHAR(100);
    
    SELECT entity_type_name INTO n FROM entity_type WHERE id = entityTypeId;    
	RETURN n;
END