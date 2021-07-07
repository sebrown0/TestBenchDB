CREATE DEFINER=`root`@`localhost` FUNCTION `test_case_exists`(testCaseId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE foundId INT UNSIGNED;
    DECLARE caseExists TINYINT DEFAULT FALSE;
    
	SELECT id INTO foundId FROM entity_test where id = testCaseId;
    IF NOT foundId IS NULL THEN
		SET caseExists = TRUE;
    END IF;
    
	RETURN caseExists;
END