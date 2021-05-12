CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_todo_id`(
	todoIdIn INT UNSIGNED,     	
	entityRowId INT UNSIGNED,     	
    entityEntityId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE todoIdOut INT UNSIGNED;    
    
    SELECT 		id 
    INTO		todoIdOut
    FROM 		entity_todo 
    WHERE 		id = todoIdIn 
    AND 		entity_id = entityRowId 
    AND 		entity_entity_id = entityEntityId;
        
	RETURN todoIdOut;
END