CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_test_lat_run`(
	IN entityTestId INT UNSIGNED,
    IN entityTestVersionId INT UNSIGNED,    
    IN entityTestEntityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME)
BEGIN
	UPDATE	entity_test 
	SET 	last_run_date = dateRun, last_run_time = timeRun
	WHERE 	entity_test_id = entityTestId
	AND 	entity_test_version_id = entityTestVersionId
	AND 	entity_id = entityTestEntityId;
END