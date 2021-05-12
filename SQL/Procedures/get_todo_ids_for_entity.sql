CREATE DEFINER=`root`@`localhost` PROCEDURE `get_todo_ids_for_entity`(
	IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED)
BEGIN	
	DROP TEMPORARY TABLE IF EXISTS temp_todo_ids;
	CREATE TEMPORARY TABLE temp_todo_ids
	SELECT	id 
	FROM 	entity_todo
	WHERE 	id = entityRowId AND entity_id = entityId;
END