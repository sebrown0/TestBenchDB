CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_id_for_test_run`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN	
	DECLARE trId INT UNSIGNED;
        
    SELECT 
		id
    INTO 
		trId
    FROM 
		test_run
	ORDER BY id DESC LIMIT 1;
    
    IF trId IS NULL THEN 
		SET trId = 1;
    END IF;

	RETURN trId;
END