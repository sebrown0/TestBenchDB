CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_id_for_row_id`(rowId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE entId INT DEFAULT 0;
    
    SELECT entity_id INTO entId FROM test_bench.entity WHERE id = rowId;    
	RETURN entId;
END