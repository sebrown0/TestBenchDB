CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_test_last_run`(
	IN entityTestRowId INT UNSIGNED,
    IN entityTestId INT UNSIGNED,    
    IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME)
BEGIN
	UPDATE	entity_test 
	SET 	last_run_date = dateRun, last_run_time = timeRun
	WHERE 	id = entityTestRowId
    AND		entity_test_id = entityTestId
	AND 	entity_id = entityRowId
	AND 	entity_entity_id = entityId;
END