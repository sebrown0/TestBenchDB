CREATE DEFINER=`root`@`localhost` FUNCTION `test_run_exists`(
	testRunIdIn INT UNSIGNED) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE c INT;
    DECLARE ret BOOLEAN DEFAULT FALSE;
    
    SELECT count(id) 
    INTO 		c
    FROM 		test_run
    WHERE 		id = testRunIdIn
    GROUP BY 	id;
    
    IF c > 0 THEN SET ret = TRUE; END IF;
	RETURN ret;
END