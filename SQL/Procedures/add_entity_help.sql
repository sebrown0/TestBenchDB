CREATE DEFINER=`root`@`localhost` PROCEDURE `add_entity_help`(
	IN has_tool_tip VARCHAR(5),
	IN tool_tip_text VARCHAR(500), 
	IN help_file_name VARCHAR(250), 
	IN help_text TEXT,
	INOUT entityHelpId INT UNSIGNED)
BEGIN
	INSERT INTO 
		`test_bench`.`entity_help` (`has_tool_tip`, `tool_tip_text`, `help_file_name`, `help_text`) 
	VALUES 
		(has_tool_tip, tool_tip_text, help_file_name, help_text);
        
	SET entityHelpId = get_next_entity_help_id();
END