CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_case_result`(
	IN passFailNotRun ENUM('Pass', 'Fail', 'NR'),
    IN testComments TEXT,
    IN entityTestEntityVersionId INT UNSIGNED,
    IN entityTestId INT UNSIGNED,
    IN entityTestEntityId INT UNSIGNED
    )
BEGIN
	DECLARE testPassed TINYINT DEFAULT 0;
    DECLARE testIgnored TINYINT  DEFAULT 0;
    
    SET @NUM_TESTS_RUN = @NUM_TESTS_RUN + 1;
    IF passFailNotRun = 'NR' THEN
		SET testIgnored = 1;
        SET @NUM_IGNORED_TESTS = @NUM_IGNORED_TESTS + 1;
    ELSEIF passFailNotRun = 'Pass' THEN
		SET testPassed = 1;        
        SET @NUM_PASSED_TESTS = @NUM_PASSED_TESTS + 1;
	ELSE
		SET @NUM_FAILED_TESTS = @NUM_FAILED_TESTS + 1; 
    END IF;
    
	INSERT INTO 
		`test_bench`.`entity_test_result` (`test_passed`, `test_ignored`, `comments`, `entity_test_entity_version_id`, `entity_test_id`, `entity_test_entity_id`) 
	VALUES 
		(testPassed, testIgnored, testComments, entityTestEntityVersionId, entityTestId, entityTestEntityId);
END