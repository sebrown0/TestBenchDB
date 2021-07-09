CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_unused_entity_row_id`(entityRowId INT UNSIGNED) RETURNS int unsigned
    DETERMINISTIC
BEGIN
    DECLARE nextRowId INT UNSIGNED;    
    
    SET nextRowId = entityRowId + 1;    
    ids:LOOP
		IF NOT entity_exists(nextRowId) THEN LEAVE ids; END IF;
        SET nextRowId = nextRowId + 1;
	END LOOP;
      
	RETURN nextRowId;
END