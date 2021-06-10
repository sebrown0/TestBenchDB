CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_version`(	
	INOUT verID INT UNSIGNED, 
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(250),
    IN versionNote TEXT,
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED)
BEGIN
	IF verID IS NULL OR verID <= 0 THEN
		SET verID = get_next_new_version_id();    
    END IF;
    
	INSERT INTO	`test_bench`.`version` 
		(`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`) 
	VALUES 
		(verID, entityName, versionNote, entityVersionType, mjr, mnr, bld)
	ON DUPLICATE KEY UPDATE
		entity_name = entityName, 
		version_note = versionNote;
END