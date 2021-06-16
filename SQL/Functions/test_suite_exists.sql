CREATE DEFINER=`root`@`localhost` FUNCTION `test_suite_exists`(testSuiteId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE foundId INT UNSIGNED;
    DECLARE suiteExists TINYINT DEFAULT FALSE;
    
	SELECT id INTO foundId FROM test_suite where id = testSuiteId;
    IF NOT foundId IS NULL THEN
		SET suiteExists = TRUE;
    END IF;
    
	RETURN suiteExists;
END