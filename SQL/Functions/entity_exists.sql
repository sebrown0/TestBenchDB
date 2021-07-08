CREATE DEFINER=`root`@`localhost` FUNCTION `entity_exists`(entityRowId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE foundId INT UNSIGNED;
    DECLARE entityExists TINYINT DEFAULT FALSE;
    
	SELECT id INTO foundId FROM entity where id = entityRowId;
    IF NOT foundId IS NULL THEN
		SET entityExists = TRUE;
    END IF;
    
	RETURN entityExists;
END