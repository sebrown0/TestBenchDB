CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_test_case_version`(			
	IN testCaseRowId INT UNSIGNED, 
    IN testCaseId INT UNSIGNED, 
    IN testCaseName VARCHAR(200),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN transGroupNum INT UNSIGNED)
BEGIN
	DECLARE versionId INT UNSIGNED DEFAULT 0;    
    
    -- updated but not tested because it's not being used.
    SET versionId = get_test_case_has_ver(entityRowId, entityEntityId, mjr, mnr, bld);        
	CALL create_or_update_version(versionId, testCaseRowId, testCaseId, testCaseName, versionNote, 'TEST', mjr, mnr, bld, transGroupNum);
END