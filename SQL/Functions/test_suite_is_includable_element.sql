CREATE DEFINER=`root`@`localhost` FUNCTION `test_suite_is_includable_element`(tsRowId INT UNSIGNED) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE isElement INT UNSIGNED DEFAULT 0;
    DECLARE include TINYINT DEFAULT 0;
    
    /* 
		Check to see is a test suite is an includable element, i.e. the entity.is_element > 1         
	*/
    
	SELECT 	is_element 
    INTO	isElement
	FROM 	test_suite ts
	JOIN 	entity ent 
	ON		ts.id = ent.id AND ts.test_suite_name = ent.entity_name
	WHERE 	ts.id = tsRowId;
    
    IF isElement > 1 THEN SET include = 1; END IF;
	RETURN include;
END