CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_of_entity_test`(entityTestRowId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    
    SELECT 
		major, minor, build 
    INTO 
		mjr, mnr, bld
    FROM 
		entity_test_has_version has_ver
	INNER JOIN 
		version ver ON ver.id = has_ver.version_id
	WHERE 
		has_ver.entity_test_id = entityTestRowId;	

	RETURN concat(mjr,".",mnr,".",bld);
END