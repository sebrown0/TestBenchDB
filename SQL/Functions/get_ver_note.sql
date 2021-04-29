CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_note`(defaultVerNote TEXT, entityName VARCHAR(250)) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN	
	DECLARE verNote TEXT;        
    
	IF @versionNote = "" THEN
		SET verNote = concat(defaultVerNote, " ", entityName);
    ELSE
		SET verNote = concat(@versionNote, " ", entityName);
    END IF;
    
	RETURN verNote;
END