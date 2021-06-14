CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_type_id`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN
	DECLARE entTypeId INT UNSIGNED;
    
	SELECT MAX(id) INTO entTypeId FROM entity_type;
    
    IF entTypeId IS NULL THEN
		SET entTypeId = 0;
    END IF;
	
    RETURN entTypeId + 1;
END