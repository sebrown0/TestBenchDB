CREATE DEFINER=`root`@`localhost` PROCEDURE `add_version`(
	IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(200),
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN verCategory ENUM('MAJOR','MINOR','BUILD'),
    IN ver VARCHAR(11),
    INOUT newVersionId INT UNSIGNED)
BEGIN
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    DECLARE createdNewVer TINYINT DEFAULT 0;
    DECLARE verNote VARCHAR(200);        
	
    SET mjr = get_major_ver_num(ver);    
    SET mnr = get_minor_ver_num(ver);
    SET bld = get_build_ver_num(ver);
     
    IF mjr > 0 THEN		
		SET createdNewVer = 0;
    ELSE
		SET mjr = 1; SET mnr = 0; SET bld = 0;   
        SET createdNewVer = 1;
        SET verNote = concat("No existing version. New major version of ", entityName);
	END IF;
        
    IF NOT createdNewVer THEN		
		IF verCategory = 'MAJOR' THEN
			SET mjr = mjr + 1; SET mnr = 0; SET bld = 0;   
            SET verNote = concat("New major version of ", entityName);
		ELSEIF verCategory = 'MINOR' THEN
			SET mnr = mnr + 1; SET bld = 0;        
            SET verNote = concat("New minor version of ", entityName);
		ELSE
			SET bld = bld + 1;
            SET verNote = concat("New build version of ", entityName);
		END IF;
    END IF;
    
    SET newVersionId = get_next_new_version_id(); 
    
    INSERT INTO 
		`test_bench`.`version` (`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`, `version_to_do_id`) 
    VALUES 
		(newVersionId, entityName, verNote, entityVersionType, mjr, mnr, bld, NULL);         
END