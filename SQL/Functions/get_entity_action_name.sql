CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_action_name`(
	actId INT UNSIGNED) RETURNS varchar(45) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE actName VARCHAR(45);    
    
	SELECT 	entity_action_type_name 
    INTO 	actName
	FROM 	test_bench.entity_action_type
	WHERE 	id = actId;
    
	RETURN actName;
END