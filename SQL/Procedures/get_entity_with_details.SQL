CREATE DEFINER=`root`@`localhost` PROCEDURE `get_entity_with_details`(IN entRowId INT UNSIGNED, IN entId INT UNSIGNED)
BEGIN
	-- Get the entity and its details/help for the row id and entity id.
    -- The row id is the version of the entity.
	SELECT 		ent.*, 
				det.id AS details_id, det.description, det.date_added, det.creation_type, det.last_tested_date, det.last_tested_time,    
				hlp.id AS help_id,hlp.has_tool_tip, hlp.tool_tip_text, hlp.help_file_name, hlp.help_text,
                ver.version_note, ver.major, ver.minor, ver.build, 
                act.id AS entity_action_id, act.entity_id AS action_entity_row_id, have_act.entity_entity_id AS action_entity_id, 
                act.entity_action_desc, act.entity_action_data, act.entity_action_type_id, get_entity_action_name(act.entity_action_type_id) AS entity_action_type_name 
	FROM 		test_bench.entity ent
	INNER JOIN 	entity_details det
			ON 	det.id = ent.entity_details_id 
	INNER JOIN 	entity_has_version has_ver
			ON	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
	INNER JOIN 	version ver
			ON  ver.id = has_ver.version_id
	INNER JOIN  entity_help hlp
			ON 	hlp.id = ent.entity_help_id
	 LEFT JOIN  entity_can_have_action have_act
			ON  have_act.entity_id = ent.id AND have_act.entity_entity_id = ent.entity_id
	 LEFT JOIN  entity_action act
			ON  act.id = have_act.entity_action_id AND act.entity_id = have_act.entity_id
	WHERE		ent.id = entRowId AND ent.entity_id = entId; 
END