CREATE DEFINER=`root`@`localhost` FUNCTION `get_entity_action_id`(
	entityRowId INT UNSIGNED,     	
    entityEntityId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE actId INT;    
    
	SELECT 		act.id 
    INTO 		actId
	FROM 		entity_action act
	INNER JOIN 	entity_can_have_action has
			ON  act.id = has.entity_action_id AND act.entity_id = has.entity_id
	WHERE 		has.entity_id = entityRowId AND has.entity_entity_id = entityEntityId; 
    
	RETURN actId;
END