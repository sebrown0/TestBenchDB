-- select * from entity_type_has_child  where parent_entity_type_id = 110 ORDER BY parent_entity_type_id;

	WITH RECURSIVE XX (prntId, parentName, chldId, childName) AS (
		SELECT 		parent_entity_type_id, entity_type_parent_name, child_entity_type_id, entity_type_child_name
		FROM 		entity_type_has_child
		WHERE		parent_entity_type_id = 92 -- get_entity_type_id_for_name(entTypeName)
		UNION ALL	
		SELECT 		parent_entity_type_id, entity_type_parent_name, child_entity_type_id, entity_type_child_name
		FROM 		entity_type_has_child YY
		INNER JOIN	XX
				ON 	YY.parent_entity_type_id = XX.chldId
	)	SELECT  prntId, parentName, chldId, childName, et.entity_type_name, e.* 
		FROM 	XX x
    INNER JOIN entity_type et
			ON 	et.id = x.prntId
	INNER JOIN entity e
			ON 	e.entity_type_id = et.id
	WHERE 		e.is_element = TRUE;
    
    call get_child_element_row_id_by_type('DkGrHeader');
    CALL get_child_element_row_id_by_parent_id(110);

CALL get_entity_name_and_type('9051','9051');

SELECT COUNT(id) FROM entity;
SELECT get_num_entities();

















/*

    WITH RECURSIVE 		ent_type_by_parent (id, parent_id, a, b, entity_type_name, has_children, lvl) AS (
			SELECT 		id, entity_type_parent_id, 0,0, entity_type_name, has_children, 0 AS lvlL
			FROM 		entity_type prnt
			WHERE 		prnt.id = get_entity_type_id_for_name('DkGrHdrSubMenu') 
			UNION ALL
			SELECT 		chld.id, chld.entity_type_parent_id, has_child.parent_entity_type_id, has_child.child_entity_type_id , chld.entity_type_name, chld.has_children, ent_by_prnt.lvl + 1
			FROM 		entity_type chld
			INNER JOIN 	ent_type_by_parent ent_by_prnt
					ON 	ent_by_prnt.id = chld.entity_type_parent_id					
			INNER JOIN 	entity_type_has_child has_child
					ON	has_child.child_entity_type_id = chld.entity_type_parent_id					
		)	SELECT 		*
			FROM 		ent_type_by_parent tpe
            INNER JOIN 	entity_type_has_child has_child
					ON	has_child.parent_entity_type_id = tpe.parent_id		
			group by 	tpe.parent_id;#
            
