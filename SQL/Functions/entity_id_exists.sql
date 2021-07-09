CREATE DEFINER=`root`@`localhost` FUNCTION `entity_id_exists`(entityId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE foundId INT UNSIGNED;
    DECLARE entityIdExists TINYINT DEFAULT FALSE;
    
	SELECT entity_id INTO foundId FROM entity where entity_id = entityId;
    IF NOT foundId IS NULL THEN
		SET entityIdExists = TRUE;
    END IF;
    
	RETURN entityIdExists;
END