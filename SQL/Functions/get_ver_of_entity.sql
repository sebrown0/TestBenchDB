CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_of_entity`(entityRowId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    
	SELECT 		ver.major, ver.minor, ver.build
    INTO 		mjr, mnr, bld
	FROM 		test_bench.entity ent
	INNER JOIN	entity_has_version has_ver
			ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id
	WHERE 		ent.id = entityRowId;
    
	RETURN concat(mjr,".",mnr,".",bld);
END