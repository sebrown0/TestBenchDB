CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_new_version_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE nextVerId INT DEFAULT 0;
    
    SELECT id INTO nextVerId FROM test_bench.`version` ORDER BY id DESC LIMIT 1;
    
    IF nextVerId = NULL THEN
		SET nextVerId = 0;
	ELSE
		SET nextVerId = nextVerId + 1;
    END IF;
	RETURN nextVerId;
END