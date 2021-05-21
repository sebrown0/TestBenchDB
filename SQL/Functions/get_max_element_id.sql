CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_element_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE maxId INT DEFAULT 0;
    
    SELECT id INTO maxId FROM test_bench.element ORDER BY id DESC LIMIT 1;
    
    IF maxId = NULL THEN 
		SET maxId = 0;
    END IF;
	RETURN maxId;
END