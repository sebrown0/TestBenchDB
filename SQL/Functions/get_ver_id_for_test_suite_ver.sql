CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_id_for_test_suite_ver`(id INT UNSIGNED, mjr SMALLINT UNSIGNED, mnr SMALLINT UNSIGNED, bld SMALLINT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE verId INT UNSIGNED;
    
    SELECT 		ts.test_suite_version_id
	INTO 		verId
    FROM 		test_suite ts
	INNER JOIN  test_suite_has_version has_ver
			ON	ts.test_suite_id = has_ver.test_suite_id
		   AND	ts.test_suite_version_id = has_ver.version_id
	INNER JOIN  version ver
			ON	ver.id = has_ver.version_id
	WHERE 
				ts.test_suite_id = id AND
				ver.major = mjr AND ver.minor = mnr AND ver.build = bld;
                
	RETURN verId; 
END