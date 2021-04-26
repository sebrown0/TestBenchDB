CREATE DEFINER=`root`@`localhost` FUNCTION `get_build_ver_num`(verNum VARCHAR(11)) RETURNS varchar(3) CHARSET utf8
    DETERMINISTIC
BEGIN	
	RETURN substring_index(verNum,'.',-1);
END