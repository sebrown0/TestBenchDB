CREATE DEFINER=`root`@`localhost` PROCEDURE `add_version`(
	IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(500),
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN ver VARCHAR(11),
    IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'),
    INOUT newVersionId INT UNSIGNED)
BEGIN
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    DECLARE createdNewVer TINYINT DEFAULT 0;
    DECLARE verNote TEXT;        
	
    SET mjr = get_major_ver_num(ver);    
    SET mnr = get_minor_ver_num(ver);
    SET bld = get_build_ver_num(ver);
 
	-- Set default if version cat not already set.
	IF NOT newVerCat IN('MAJOR','MINOR','BUILD') THEN
		SET newVerCat = 'MAJOR';
    END IF;
    
    IF mjr > 0 THEN		
		SET createdNewVer = 0;
    ELSE
		SET mjr = 1; SET mnr = 0; SET bld = 0;   
        SET createdNewVer = 1;
        SET verNote = get_ver_note("No existing version. New major version of", entityName);
	END IF;
        
    IF NOT createdNewVer THEN		
		IF newVerCat = 'MAJOR' THEN
			SET mjr = mjr + 1; SET mnr = 0; SET bld = 0;   
            SET verNote = get_ver_note("New major version of", entityName);
		ELSEIF newVerCat = 'MINOR' THEN
			SET mnr = mnr + 1; SET bld = 0;        
            SET verNote = get_ver_note("New minor version of", entityName);
		ELSE
			SET bld = bld + 1;
            SET verNote = get_ver_note("New build version of", entityName);
		END IF;
    END IF;
    
    SET newVersionId = get_next_new_version_id(); 

    INSERT INTO 
		`test_bench`.`version` (`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`) 
    VALUES 
		(newVersionId, entityName, verNote, entityVersionType, mjr, mnr, bld);         
END