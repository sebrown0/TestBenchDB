CREATE DEFINER=`root`@`localhost` FUNCTION `is_place_holder`(fld VARCHAR(100)) RETURNS tinyint
    DETERMINISTIC
BEGIN	
	RETURN left(fld,1) = '#' AND right(fld,1) = '#';
END