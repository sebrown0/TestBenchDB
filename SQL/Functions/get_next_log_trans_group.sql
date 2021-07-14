CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_log_trans_group`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
	RETURN (SELECT max(trans_group_num)+1 FROM log);
END