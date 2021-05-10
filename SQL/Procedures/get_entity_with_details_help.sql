CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_with_details_help`(IN entRowId INT UNSIGNED, IN entId INT UNSIGNED)
BEGIN
	-- Get the entity and its details/help for the row id and entity id.
    -- The row id is the version of the entity.
	SELECT 		ent.*, 
				det.id AS details_id, det.description, det.date_added, det.creation_type, det.last_tested_date, det.last_tested_time,    
				hlp.id AS help_id,hlp.has_tool_tip, hlp.tool_tip_text, hlp.help_file_name, hlp.help_text
	FROM 		test_bench.entity ent
	INNER JOIN 	entity_details det
			ON 	det.id = ent.entity_details_id 
	INNER JOIN  entity_help hlp
			ON 	hlp.id = ent.entity_help_id
	WHERE		ent.id = entRowId AND ent.entity_id = entId;
END