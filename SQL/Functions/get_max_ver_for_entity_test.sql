CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_ver_for_entity_test`(entityTestId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8
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
		has_ver.entity_test_entity_test_id = entityTestId
	ORDER BY 
		ver.major desc, ver.minor desc, ver.build desc
	LIMIT 1;

	RETURN concat(mjr,".",mnr,".",bld);
END