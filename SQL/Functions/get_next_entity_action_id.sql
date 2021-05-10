CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_action_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE nextId INT DEFAULT 0;
    
    SELECT id INTO nextId FROM test_bench.entity_action ORDER BY id DESC LIMIT 1;
    
    IF nextId = NULL THEN 
		SET nextId = 0;
    END IF;
	RETURN nextId + 1;
END