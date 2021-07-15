CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_log_trans_group`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
	DECLARE nxt INT UNSIGNED;
    
    SELECT max(trans_group_num)+1 INTO nxt FROM log;
    IF nxt IS NULL OR nxt <= 0 THEN SET nxt = 1; END IF;
	RETURN nxt;
END