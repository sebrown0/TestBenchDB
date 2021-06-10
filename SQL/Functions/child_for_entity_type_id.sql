CREATE DEFINER=`root`@`localhost` FUNCTION `child_for_entity_type_id`(prntId INT UNSIGNED, chldId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE rwId INT UNSIGNED;    
    
	SELECT 	id 
    INTO 	rwId
	FROM 	entity_type_has_child 
	WHERE 	parent_entity_type_id = prntId AND child_entity_type_id = chldId ; 
    
	RETURN rwId;
END