CREATE DEFINER=`root`@`localhost` FUNCTION `get_parent_entity_type_name`(chldId INT UNSIGNED) RETURNS varchar(45) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE prntName VARCHAR(45);
    
    SELECT 	etPrnt.entity_type_name
    INTO	prntName
	FROM 	entity_type etPrnt
	JOIN	entity_type etChld
	ON		etChld.entity_type_parent_id = etPrnt.id
	WHERE 	etChld.id = chldId;
    
    IF prntName IS NULL THEN SET prntName = ""; END IF;

	RETURN prntName;
END