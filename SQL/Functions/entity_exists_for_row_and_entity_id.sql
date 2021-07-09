CREATE DEFINER=`root`@`localhost` FUNCTION `entity_exists_for_row_and_entity_id`(entityRowId INT UNSIGNED, entityId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE foundId INT UNSIGNED;
    DECLARE entityExists TINYINT DEFAULT FALSE;
    
	SELECT id INTO foundId FROM entity WHERE id = entityRowId AND entity_id = entityId;
    IF NOT foundId IS NULL THEN
		SET entityExists = TRUE;
    END IF;
    
	RETURN entityExists;
END