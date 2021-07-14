CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_test_suite_version`(			
	IN testSuiteRowId INT UNSIGNED, 
    IN testSuiteId INT UNSIGNED, 
    IN testSuiteName VARCHAR(200),
    IN versionNote TEXT,
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN transGroupNum INT UNSIGNED)
BEGIN
	DECLARE versionId INT UNSIGNED DEFAULT 0;    
    
    -- updated but not tested because it's not being used.
    SET versionId = get_test_suite_has_ver(testSuiteRowId, testSuiteId, mjr, mnr, bld);        
    CALL create_or_update_version(versionId, testSuiteRowId, testSuiteId, testSuiteName, versionNote, 'TEST_SUITE', mjr, mnr, bld, transGroupNum);
END