CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE nextEntityId INT DEFAULT 0;
    
    SELECT id INTO nextEntityId FROM test_bench.entity ORDER BY id DESC LIMIT 1;
    
    IF nextEntityId = NULL THEN 
		SET nextEntityId = 0;
    END IF;
	RETURN nextEntityId + 1;
END