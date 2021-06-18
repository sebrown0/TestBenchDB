CREATE DEFINER=`root`@`localhost` PROCEDURE `get_child_element_row_id_by_parent_id`(IN entityTypeId INT UNSIGNED)
BEGIN
	WITH RECURSIVE 		ent_type_by_parent (id, parent_id, entity_type_name) AS (
			SELECT 		id, entity_type_parent_id, entity_type_name
			FROM 		entity_type prnt
			WHERE 		prnt.id = entityTypeId
			UNION ALL
			SELECT 		chld.id, chld.entity_type_parent_id, chld.entity_type_name
			FROM 		entity_type chld
			INNER JOIN 	ent_type_by_parent ent_by_prnt
					ON 	ent_by_prnt.id = chld.entity_type_parent_id		
		)	SELECT 		ent.id 
			FROM 		ent_type_by_parent tpe
			INNER JOIN 	entity
						ent
					ON 	ent.entity_type_id = tpe.id
			WHERE 		tpe.id != entityTypeId AND is_element = TRUE;
END