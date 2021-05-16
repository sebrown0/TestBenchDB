CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_case_result`(
	IN testPassed ENUM('Pass', 'Fail', 'NR'),
    IN testInored ENUM('TRUE', 'FALSE'),
    IN testComments TEXT,
    IN entityTestRowId INT UNSIGNED,
    IN entityTestId INT UNSIGNED,     
    IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME)
BEGIN 
	INSERT INTO `test_bench`.`entity_test_result` (
		`result_timestamp`, `test_passed`, `test_ignored`, `comments`, `entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) 
	VALUES (
		current_time(), testPassed, testInored, testComments, entityTestRowId, entityTestId, entityRowId, entityId);
		
    CALL update_entity_test_last_run(entityTestRowId, entityTestId, entityRowId, entityId, dateRun, timeRun);
    CALL update_entity_last_tested(entityRowId, entityId, dateRun, timeRun);
END