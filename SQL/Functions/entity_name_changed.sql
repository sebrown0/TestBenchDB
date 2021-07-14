CREATE DEFINER=`root`@`localhost` FUNCTION `entity_name_changed`(entityRowId INT UNSIGNED, entityName VARCHAR(500)) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE oldName VARCHAR(500);
    DECLARE hasChanged TINYINT DEFAULT FALSE;
    
	IF entity_exists(entityRowId) THEN
		SELECT entity_name INTO oldName FROM entity WHERE id = entityRowId;
        IF entityName != oldName THEN
			SET hasChanged = TRUE;
        END IF;
    END IF;
	
    RETURN hasChanged;
END