CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_fail_reasons`(IN entityTypeName VARCHAR(45))
BEGIN
	SELECT 		* 
    FROM 		entity_type_has_fail_reason 
				has_reason
    INNER JOIN 	entity_type_fail_reason
				reason
			ON	reason.id = has_reason.entity_type_fail_reason_id
    WHERE 		entity_type_name = entityTypeName 
    ORDER BY 	is_primary_reason DESC;    
END