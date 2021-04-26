CREATE DEFINER=`root`@`localhost` FUNCTION `get_minor_ver_num`(verNum VARCHAR(11)) RETURNS varchar(3) CHARSET utf8
    DETERMINISTIC
BEGIN	
	RETURN substring_index(substring_index(verNum,'.',2),'.',-1);
END