CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_id_from_test_suite`(id INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
    SELECT 
		test_suite_version_id
    INTO 
		verId
    FROM 
		test_suite
	WHERE 
		test_suite_id = id
	ORDER BY 
		test_suite_version_id desc
	LIMIT 1;

	RETURN verId; 
END