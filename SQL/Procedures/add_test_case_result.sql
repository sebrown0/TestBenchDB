CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_case_result`(
	IN test_passed ENUM('Pass', 'Fail', 'NR'),
    IN test_ignored ENUM('TRUE', 'FALSE'),
    IN testComments TEXT,
    IN entityTestId INT UNSIGNED,
    IN entityTestVersionId INT UNSIGNED,     
    IN entityTestEntityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME
    )
BEGIN 
	INSERT INTO `test_bench`.`entity_test_result` 
		(`test_passed`, `test_ignored`, `comments`, `entity_test_id`, `entity_test_version_id`, `entity_test_entity_id`)
	VALUES  
		(test_passed, test_ignored, testComments, entityTestId, entityTestVersionId, entityTestEntityId);
	
    CALL update_entity_test_last_run(entityTestId, entityTestVersionId, entityTestEntityId, dateRun, timeRun);
END