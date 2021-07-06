CREATE DEFINER=`root`@`localhost` PROCEDURE `get_parent_element_types`()
BEGIN
	SELECT		entity_type_entity_type_name
	FROM 		entity
	WHERE		parent_id = 0 AND is_element = 1
    GROUP BY 	entity_type_entity_type_name
    ORDER BY	entity_type_entity_type_name ASC;
END