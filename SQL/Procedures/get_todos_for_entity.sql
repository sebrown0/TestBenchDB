CREATE DEFINER=`root`@`localhost` PROCEDURE `get_todos_for_entity`(
	IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED)
BEGIN	
	SELECT	id AS entity_todo_id, entity_id, entity_entity_id, when_was_todo_added, todo_desc, is_todo_done, when_was_todo_done
	FROM 	entity_todo
	WHERE 	entity_id = entityRowId AND entity_entity_id= entityId;
END