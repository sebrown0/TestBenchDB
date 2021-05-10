CREATE DEFINER=`root`@`localhost` FUNCTION `get_test_case_has_ver`(rowId INT UNSIGNED, testCaseId INT UNSIGNED, mjr SMALLINT UNSIGNED, mnr SMALLINT UNSIGNED, bld SMALLINT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN	
	DECLARE verId BOOL;
    
	SELECT 		ver.id
	INTO 		verId
	FROM 		test_bench.version ver
	INNER JOIN 	test_bench.entity_test_has_version has
			ON 	has.version_id = ver.id 
	WHERE 		has.entity_test_id = rowId 
	AND 		has.entity_test_entity_test_id = testCaseId
	AND			ver.major = mjr
	AND			ver.minor = mnr
	AND		 	ver.build = bld;
                
	RETURN verId; 
END