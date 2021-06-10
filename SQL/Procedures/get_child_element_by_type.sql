CREATE DEFINER=`root`@`localhost` PROCEDURE `get_child_element_by_type`(IN entityTypeName VARCHAR(100))
BEGIN
	DECLARE entityTypeId INT UNSIGNED;
	SET entityTypeId = get_entity_type_id_for_name(entityTypeName);
    
	WITH RECURSIVE 		ent_type_by_parent (id, parent_id, entity_type_name, has_children) AS (
			SELECT 		id, entity_type_parent_id, entity_type_name, has_children
			FROM 		entity_type prnt
			WHERE 		prnt.id = entityTypeId
			UNION ALL
			SELECT 		chld.id, chld.entity_type_parent_id, chld.entity_type_name, chld.has_children
			FROM 		entity_type chld
			INNER JOIN 	ent_type_by_parent ent_by_prnt
					ON 	ent_by_prnt.id = chld.entity_type_parent_id		
		)	SELECT 		ent.id AS entity_row_id, ent.entity_name, tpe.*
			FROM 		ent_type_by_parent tpe
			INNER JOIN 	entity
						ent
					ON 	ent.entity_type_id = tpe.id
			WHERE 		is_element = TRUE;
END