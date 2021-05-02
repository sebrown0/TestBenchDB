CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_id_from_test_case`(id INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
    SELECT 
		entity_test_version_id
    INTO 
		verId
    FROM 
		entity_test
	WHERE 
		entity_test_id = id
	ORDER BY 
		entity_test_version_id desc
	LIMIT 1;

	RETURN verId; 
END