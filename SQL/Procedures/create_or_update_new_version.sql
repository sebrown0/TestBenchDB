CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_new_version`(	
	INOUT verID INT UNSIGNED, 
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(200),
    IN versionNote TEXT,
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN versionTodoId INT UNSIGNED)
BEGIN
	IF verID IS NULL THEN
		SET verID = get_next_new_version_id();
    END IF;
    
	INSERT INTO	`test_bench`.`version` 
		(`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`, `version_to_do_id`) 
	VALUES 
		(verID, entityName, versionNote, entityVersionType, mjr, mnr, bld, versionTodoId)
	ON DUPLICATE KEY UPDATE
		entity_name = entityName, 
		version_note = versionNote,
		version_to_do_id = versionTodoId;
END