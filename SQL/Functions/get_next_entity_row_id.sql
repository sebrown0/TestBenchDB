CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_row_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE nextEntityRowId INT DEFAULT 0;
    
    SELECT id INTO nextEntityRowId FROM test_bench.entity ORDER BY id DESC LIMIT 1;
    
    IF nextEntityRowId = NULL THEN 
		SET nextEntityRowId = 0;
    END IF;
	RETURN nextEntityRowId + 1;
END