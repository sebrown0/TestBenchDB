CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_help`(
	IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
	IN hasToolTip VARCHAR(5),
	IN toolTipText VARCHAR(500), 
	IN helpFileName VARCHAR(250), 
	IN helpText TEXT)
BEGIN
	DECLARE helpId INT UNSIGNED;
    
    SET helpId = get_entity_help_id(entityRowId, entityId);    
	IF helpId IS NULL OR helpId <= 0 THEN
		SET helpId = get_next_entity_help_id();        
    END IF;
    
	INSERT INTO 
		`test_bench`.`entity_help` (`id`, `entity_id`, `has_tool_tip`, `tool_tip_text`, `help_file_name`, `help_text`) 
	VALUES 
		(helpId, entityRowId, hasToolTip, toolTipText, helpFileName, helpText)
	ON DUPLICATE KEY UPDATE
		has_tool_tip = hasToolTip, 
        tool_tip_text = toolTipText, 
        help_file_name = helpFileName, 
        help_text = helpText; 
        
	UPDATE entity ent SET ent.entity_help_id = helpId WHERE ent.id = entityRowId;
END