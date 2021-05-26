CREATE DEFINER=`root`@`localhost` FUNCTION `get_parent_entity_type_name_for_entity`(entRowId INT UNSIGNED) RETURNS varchar(45) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	RETURN  get_parent_entity_type_name(get_entity_type_id_for_entity_row_id(entRowId));
END