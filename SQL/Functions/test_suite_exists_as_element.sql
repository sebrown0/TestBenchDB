CREATE DEFINER=`root`@`localhost` FUNCTION `test_suite_exists_as_element`(tsRowId INT UNSIGNED) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	DECLARE tsExists INT UNSIGNED DEFAULT 0;
    DECLARE elementId INT UNSIGNED DEFAULT 0;
    DECLARE tsExistsAsElement TINYINT DEFAULT FALSE;
    
    SELECT id INTO tsExists FROM test_suite WHERE id = tsRowId;
    IF tsExists IS NOT NULL AND tsExists > 0 THEN
		-- The test suite row id should always be the same as the entity row id.
        -- Don't like doing it this way but use for now.
		SELECT is_element INTO elementId FROM test_bench.entity WHERE id = tsRowId AND is_element > 0;
        IF elementId IS NOT NULL AND elementId > 0 THEN
			SET tsExistsAsElement = TRUE;
		END IF;
    END IF;
    
	RETURN tsExistsAsElement;
END