CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_test_case_version`(			
	IN testCaseRowId INT UNSIGNED, 
    IN testCaseId INT UNSIGNED, 
    IN testCaseName VARCHAR(200),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN versionTodoId INT UNSIGNED)
BEGIN
	DECLARE hasVer BOOL;
    DECLARE versionId INT UNSIGNED;
    
    SET hasVer = get_test_case_has_ver(testCaseRowId, testCaseId, mjr, mnr, bld);
    SET versionId = hasVer;
    
	CALL create_or_update_version(versionId, testCaseRowId, testCaseId, testCaseName, versionNote, 'TEST', mjr, mnr, bld, versionTodoId);
    IF hasVer IS NULL OR hasVer <= 0 THEN    
		CALL create_test_case_has_ver(versionId, testCaseRowId, testCaseId);	
    END IF;
END