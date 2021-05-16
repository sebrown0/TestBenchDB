CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_last_tested`(	 
    IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME)
BEGIN
	UPDATE	entity_details 
	SET 	last_tested_date = dateRun, last_tested_time = timeRun
	WHERE 	id = entityRowId
    AND		entity_id = entityId;
END