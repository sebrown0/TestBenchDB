CREATE DEFINER=`root`@`localhost` PROCEDURE `create_entity_details`(	
    IN entityDesc TEXT, 
    IN creationType ENUM('AUTO', 'MAN'),
    INOUT entityDetailsId INT UNSIGNED)
BEGIN
	SET entityDetailsId = get_next_entity_details_id();
	INSERT INTO 
		`test_bench`.`entity_details` (`id`, `description`, `date_added`, `creation_type`, `last_tested_date`, `last_tested_time`)
    VALUES 
		(entityDetailsId, entityDesc, now(), creationType, NULL, NULL);
END