CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_initial_version`(
    IN entityName VARCHAR(45),
    IN versionType ENUM('ENTITY', 'TEST'),
    INOUT newVersionId INT UNSIGNED)
BEGIN
	DECLARE initialDesc VARCHAR(200);
    
    SET newVersionId = get_next_new_version_id();   
    
    INSERT INTO 
		`test_bench`.`version` (`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`) 
	VALUES 
		(newVersionId, entityName, "Initial Version", versionType, 1, 0, 0);

END