CREATE DEFINER=`root`@`localhost` PROCEDURE `create_or_update_entity_todo`(
	IN todoId INT UNSIGNED,
	IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
	IN todoDesc VARCHAR(1000),
	IN isTodoDone TINYINT, 
	IN whenWasTodoDone DATE)
BEGIN
	
    IF NOT todoId IS NULL THEN		
        SET todoId = get_entity_todo_id(todoId, entityRowId, entityId); 
		IF todoId IS NULL THEN
			SET todoId = get_next_entity_todo_id();
        END IF;
    ELSE
		SET todoId = get_next_entity_todo_id();
    END IF;
            
	INSERT INTO `test_bench`.`entity_todo` 
		(`id`, `entity_id`, `entity_entity_id`, `when_was_todo_added`, `todo_desc`, `is_todo_done`, `when_was_todo_done`) 
	VALUES 
		(todoId, entityRowId, entityId, now(), todoDesc, isTodoDone, whenWasTodoDone)
	ON DUPLICATE KEY UPDATE
		todo_desc = todoDesc, 
        is_todo_done = isTodoDone, 
        when_was_todo_done = whenWasTodoDone;         	
END