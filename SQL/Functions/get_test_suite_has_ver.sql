CREATE DEFINER=`root`@`localhost` FUNCTION `get_test_suite_has_ver`(rowId INT UNSIGNED, testSuiteId INT UNSIGNED, mjr SMALLINT UNSIGNED, mnr SMALLINT UNSIGNED, bld SMALLINT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN	
	DECLARE verId BOOL;
    
	SELECT 		ver.id
	INTO 		verId
	FROM 		test_bench.version ver
	INNER JOIN 	test_bench.test_suite_has_version has
			ON 	has.version_id = ver.id 
	WHERE 		has.test_suite_id = rowId 
	AND 		has.test_suite_test_suite_id = testSuiteId
	AND			ver.major = mjr
	AND			ver.minor = mnr
	AND		 	ver.build = bld;
                
	RETURN verId; 
END