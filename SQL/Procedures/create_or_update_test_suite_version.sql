CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_test_suite_version`(			
	IN testSuiteRowId INT UNSIGNED, 
    IN testSuiteId INT UNSIGNED, 
    IN testSuiteName VARCHAR(200),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN versionTodoId INT UNSIGNED)
BEGIN
	DECLARE hasVer BOOL;
    DECLARE versionId INT UNSIGNED;
    
    SET hasVer = get_test_suite_has_ver(testSuiteRowId, testSuiteId, mjr, mnr, bld);
    SET versionId = hasVer;
    
	CALL create_or_update_version(versionId, testSuiteRowId, testSuiteId, testSuiteName, versionNote, 'TEST_SUITE', mjr, mnr, bld, versionTodoId);
    IF hasVer IS NULL OR hasVer <= 0 THEN    
		CALL create_test_suite_has_ver(versionId, testSuiteRowId, testSuiteId);	
    END IF;
END