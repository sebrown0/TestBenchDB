CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_details_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE nextId INT DEFAULT 0;
    
    SELECT id INTO nextId FROM test_bench.entity_details ORDER BY id DESC LIMIT 1;
    
    IF nextId = NULL THEN
		SET nextId = 1;
    ELSE
		SET nextId = nextId + 1;
    END IF;
	RETURN nextId;
END