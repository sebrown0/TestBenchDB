CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_details`(	
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED, 
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    IN lastTestedDate DATE, 
    IN lastTestedTime TIME)
BEGIN
	DECLARE detailsId INT UNSIGNED;
    
    SET detailsId = get_entity_details_id(entityRowId, entityId);    
	IF detailsId IS NULL OR detailsId <= 0 THEN
		SET detailsId = get_next_entity_details_id();      
	ELSE
		-- We don't want to overwrite the 'last tested' with NULLs.
        IF lastTestedDate IS NULL THEN
			SELECT 	last_tested_date, last_tested_time 
			INTO	lastTestedDate, lastTestedTime
			FROM 	entity_details
			WHERE 	id = detailsId AND entity_id = entityRowId;
		END IF;
    END IF;
    
	INSERT INTO 
		`test_bench`.`entity_details` (`id`, `entity_id`, `description`, `date_added`, `creation_type`, `last_tested_date`, `last_tested_time`)
    VALUES 
		(detailsId, entityRowId, entityDesc, now(), creationType, lastTestedDate, lastTestedTime)
	ON DUPLICATE KEY UPDATE
		description = entityDesc,
        last_tested_date = lastTestedDate,
        last_tested_time = lastTestedTime;
	
    UPDATE entity ent SET ent.entity_details_id = detailsId WHERE ent.id = entityRowId;
END