CREATE DEFINER=`root`@`localhost` FUNCTION `get_num_entities`() RETURNS int(11)
    DETERMINISTIC
BEGIN    
	DECLARE c INT(11);
    
    SELECT COUNT(id) INTO c FROM entity;
    IF c IS NULL OR c < 0 THEN
		SET c=0;
    END IF;
	RETURN c;
END