CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_of_test_suite`(testSuiteRowId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    
	SELECT 		ver.major, ver.minor, ver.build
    INTO 		mjr, mnr, bld
	FROM 		test_suite ts
	INNER JOIN	entity_has_version has_ver
			ON 	has_ver.entity_id = ts.id AND has_ver.entity_entity_id = ts.test_suite_id
	INNER JOIN 	version ver 
			ON 	ver.id = has_ver.version_id
	WHERE 		ts.id = testSuiteRowId;
    
	RETURN concat(mjr,".",mnr,".",bld);
END