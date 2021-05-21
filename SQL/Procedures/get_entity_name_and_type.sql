CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_name_and_type`(IN rowId INT UNSIGNED, IN entId INT UNSIGNED)
BEGIN
	SELECT 	entity_name, entity_type_entity_type_name 
	FROM 	test_bench.entity
	WHERE 	id = rowId AND entity_id = entId;
END