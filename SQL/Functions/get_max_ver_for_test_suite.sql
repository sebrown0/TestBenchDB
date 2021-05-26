CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_ver_for_test_suite`(testSuiteId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8
    DETERMINISTIC
BEGIN	
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    
    -- Get the max version for the test suite id.
    -- Using the test suite id as the test suite row id is effectively the version.
    -- So we want to get all 'versions'.
    SELECT 
		major, minor, build 
    INTO 
		mjr, mnr, bld
    FROM 
		test_suite_has_version has_ver
	INNER JOIN 
		version ver ON ver.id = has_ver.version_id
	WHERE 
		has_ver.test_suite_test_suite_id = testSuiteId
	ORDER BY 
		ver.major desc, ver.minor desc, ver.build desc
	LIMIT 1;

	RETURN concat(mjr,".",mnr,".",bld);
END