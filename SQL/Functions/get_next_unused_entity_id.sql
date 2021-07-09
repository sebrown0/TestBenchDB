CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_unused_entity_id`(entityRowId INT UNSIGNED) RETURNS int unsigned
    DETERMINISTIC
BEGIN    
    DECLARE nextId INT UNSIGNED;
    
    /* Get the next available entity id given an entity row id */
    
    SET nextId = entityRowId;    
    ids:LOOP
		IF NOT entity_id_exists(nextId) THEN LEAVE ids; END IF;
        SET nextId = nextId + 1;
	END LOOP;
    
	RETURN nextId;
END