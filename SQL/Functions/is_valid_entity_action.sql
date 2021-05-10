CREATE DEFINER=`root`@`localhost` FUNCTION `is_valid_entity_action`(entityActionTypeId INT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE retVal BOOLEAN;
    
	IF entityActionTypeId IN(SELECT id FROM entity_action_type) THEN
		SET retVal = TRUE;
	ELSE
		SET retVal = FALSE;
    END IF;
    
    RETURN retVal;
END