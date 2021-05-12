CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_todo_id`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN
	DECLARE entityTodoId INTEGER UNSIGNED;
    
    SELECT id INTO entityTodoId FROM entity_todo ORDER BY id DESC LIMIT 1;

    IF entityTodoId IS NULL THEN
		SET entityTodoId = 0;
    END IF;
    
	RETURN entityTodoId + 1;
END