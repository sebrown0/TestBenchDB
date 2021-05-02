CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_id_from_entity`(id INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
    SELECT 
		entity_version_id
    INTO 
		verId
    FROM 
		entity
	WHERE 
		entity_id = id
	ORDER BY 
		entity_version_id desc
	LIMIT 1;

	RETURN verId; 
END