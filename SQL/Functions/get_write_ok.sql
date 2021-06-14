CREATE DEFINER=`root`@`localhost` FUNCTION `get_write_ok`() RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	RETURN @WriteOk;
END