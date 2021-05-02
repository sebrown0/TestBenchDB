CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_id_for_entity_test_ver`(id INT UNSIGNED, mjr SMALLINT UNSIGNED, mnr SMALLINT UNSIGNED, bld SMALLINT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
    SELECT 		et.entity_test_version_id
	INTO 		verId
    FROM 		entity_test et
	INNER JOIN  entity_test_has_version has_ver
			ON	et.entity_test_id = has_ver.entity_test_id
		   AND	et.entity_test_version_id = has_ver.version_id
	INNER JOIN  version ver
			ON	ver.id = has_ver.version_id
	WHERE 
				et.entity_test_id = id AND
				ver.major = mjr AND ver.minor = mnr AND ver.build = bld;
                
	RETURN verId; 
END