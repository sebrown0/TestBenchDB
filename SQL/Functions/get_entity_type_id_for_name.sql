CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_type_id_for_name`(entityName VARCHAR(45)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE entityId INT;
    
    SELECT id INTO entityId FROM test_bench.entity_type WHERE entity_type_name = entityName;    
	RETURN entityId;
END