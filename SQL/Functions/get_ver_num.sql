CREATE DEFINER=`root`@`localhost` FUNCTION `get_ver_num`(verId INT UNSIGNED) RETURNS varchar(11) CHARSET utf8
    DETERMINISTIC
BEGIN
	DECLARE mjr INT UNSIGNED;
    DECLARE mnr INT UNSIGNED;
    DECLARE bld INT UNSIGNED;
    
    SELECT major, minor, build 
    INTO mjr, mnr, bld
    FROM test_bench.version WHERE id = verId;

	RETURN concat(mjr,".",mnr,".",bld);
END