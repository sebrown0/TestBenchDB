CREATE DEFINER=`root`@`localhost` PROCEDURE `add_version`(
	IN entityId INT UNSIGNED, 
    IN entityName VARCHAR(500),
    IN entityVersionType ENUM('ENTITY', 'TEST', 'TEST_SUITE'),
    IN ver VARCHAR(11),
    IN newVerCat ENUM('MAJOR', 'MINOR', 'BUILD'),
    INOUT newVersionId INT UNSIGNED)
BEGIN
	DECLARE mjr INT;
    DECLARE mnr INT;
    DECLARE bld INT;
    DECLARE createdNewVer TINYINT DEFAULT 0;
    DECLARE verNote TEXT DEFAULT 'None';        
	
	-- Set default if version cat not already set.
	IF NOT newVerCat IN('MAJOR','MINOR','BUILD') THEN
		SET newVerCat = 'MAJOR';
    END IF;
    
    IF NOT ver IS NULL THEN
		SET mjr = get_major_ver_num(ver);    
		SET mnr = get_minor_ver_num(ver);
		SET bld = get_build_ver_num(ver);
	ELSE
		SET mjr = 0;
	END IF;
    
    IF mjr > 0 THEN		
		SET createdNewVer = 0;        
    ELSE
		SET mjr = 1; SET mnr = 0; SET bld = 0;   
        SET createdNewVer = 1;
        SET verNote = concat("No existing version. New major version of ", entityName);
	END IF;
    
    SELECT mjr,verNote;
    
    IF NOT createdNewVer THEN		
		IF newVerCat = 'MAJOR' THEN
			SET mjr = mjr + 1; SET mnr = 0; SET bld = 0;   
            SET verNote = concat("New major version of ", entityName);
		ELSEIF newVerCat = 'MINOR' THEN
			SET mnr = mnr + 1; SET bld = 0;        
            SET verNote = concat("New minor version of ", entityName);
		ELSE
			SET bld = bld + 1;
            SET verNote = concat("New build version of ", entityName);
		END IF;
    END IF;
    
    SET newVersionId = get_next_new_version_id(); 
	IF verNote IS NULL THEN SET verNote = "None"; END IF;
    
    INSERT INTO 
		`test_bench`.`version` (`id`, `entity_name`, `version_note`, `version_type`, `major`, `minor`, `build`) 
    VALUES 
		(newVersionId, entityName, verNote, entityVersionType, mjr, mnr, bld);         
END