CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_version`(	
	INOUT verID INT UNSIGNED, 
	IN entityRowId INT UNSIGNED, 
    IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(500),
    IN versionNote TEXT,
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN mjr INT UNSIGNED,
    IN mnr INT UNSIGNED,
    IN bld INT UNSIGNED,
    IN transGroupNum INT UNSIGNED)
BEGIN
    DECLARE logMsg VARCHAR(1000);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SET logMsg = concat(
			"Unable to update or create version for [Entity: ", 
            entityVersionType, ", ", entityRowId, ", ", entityName, ", " , "v", mjr, ".", mnr, ".", bld, "]");
		CALL new_log_entry("ERROR", logMsg, "create_or_update_version", transGroupNum);
    END;
    
	IF verID IS NULL OR verID <= 0 THEN
		SET verID = get_next_new_version_id();    
        
        INSERT INTO	`test_bench`.`version` 
			(`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`) 
		VALUES 
			(verID, entityName, versionNote, entityVersionType, mjr, mnr, bld);
		SET logMsg = concat(
			"Created version for [Entity: ",
			entityVersionType, ", ", entityRowId, ", ", entityName, ", " , "v", mjr, ".", mnr, ".", bld, "]");
            
		IF entityVersionType = 'ENTITY' THEN
			CALL create_entity_has_ver(verID, entityRowId, entityId);	
        ELSEIF entityVersionType = 'TEST' THEN
			CALL create_test_case_has_ver(verID, entityRowId, entityId);	
        ELSEIF entityVersionType = 'TEST_SUITE' THEN
			CALL create_test_suite_has_ver(verID, entityRowId, entityId);	
        END IF;
	ELSE
		UPDATE 	version
        SET 	entity_name = entityName,
				version_note = versionNote, 
				version_type = entityVersionType,
				major = mjr, 
				minor = mnr, 
				build = bld
		WHERE	id  = verID;
        SET logMsg = concat(
			"Updated version for [Entity: ",
			entityVersionType, ", ", entityRowId, ", ", entityName, ", " , "v", mjr, ".", mnr, ".", bld, "]");
    END IF;    
    
	CALL new_log_entry("INFO", logMsg, "create_or_update_version", transGroupNum);    
END