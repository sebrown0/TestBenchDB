CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_entity_help_id`() RETURNS int(10) unsigned
    DETERMINISTIC
BEGIN
	DECLARE entityHelpId INTEGER UNSIGNED;
    
	SELECT id INTO entityHelpId FROM `entity_help` ORDER BY id DESC LIMIT 1;
    IF entityHelpId IS NULL THEN
		SET entityHelpId = 1;
    END IF;
    
	RETURN entityHelpId;
END