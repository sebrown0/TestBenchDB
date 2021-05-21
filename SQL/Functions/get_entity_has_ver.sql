CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_has_ver`(entRowId INT UNSIGNED, entityId INT UNSIGNED, mjr SMALLINT UNSIGNED, mnr SMALLINT UNSIGNED, bld SMALLINT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
	SELECT 		ver.id
	INTO 		verId
	FROM 		test_bench.version ver
	INNER JOIN 	test_bench.entity_has_version has
			ON 	has.version_id = ver.id 
	WHERE 		has.entity_id = entRowId 
	AND 		has.entity_entity_id = entityId
	AND			ver.major = mjr
	AND			ver.minor = mnr
	AND		 	ver.build = bld;
                
	IF verId > 0 THEN
		RETURN 1; 
	ELSE
		RETURN 0; 
    END IF;
END