CREATE DEFINER=`root`@`localhost` PROCEDURE `get_elements_of_type_name`(IN typeName VARCHAR(250))
BEGIN
	SELECT 		id, entity_name, entity_type_entity_type_name
	FROM 		entity ent
	WHERE 		ent.parent_id = 0 AND is_element = 1 AND entity_type_entity_type_name = typeName
	ORDER BY 	id, ent.entity_type_entity_type_name;
END