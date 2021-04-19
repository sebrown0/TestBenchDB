CREATE DEFINER=`root`@`localhost` PROCEDURE `create_entity_todo`( 
	IN entityId INT UNSIGNED, 
    IN todoDesc VARCHAR(1000))
BEGIN
	DECLARE todoId INT UNSIGNED DEFAULT 0;
    
	INSERT INTO 
		`test_bench`.`version_to_do` (`when_was_todo_added`, `todo_desc`, `is_todo_done`, `when_was_todo_done`) 
	VALUES 
		(now(), todoDesc, 0, NULL);
	
    -- Return the ID of the record we just created.
    SELECT id INTO todoId FROM version_to_do ORDER BY id DESC LIMIT 1;
    
    INSERT INTO 
		`test_bench`.`version_can_have_version_to_do` (`version_id`, `version_to_do_id`) 
	VALUES 
		(get_latest_version_id(entityId), todoId);
END