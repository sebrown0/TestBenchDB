CREATE DEFINER=`root`@`localhost` FUNCTION `test_case_exists_as_element`(tcRowId INT UNSIGNED) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	DECLARE tcExists INT UNSIGNED DEFAULT 0;
    DECLARE elementId INT UNSIGNED DEFAULT 0;
    DECLARE tcExistsAsElement TINYINT DEFAULT FALSE;
    
    SELECT id INTO tcExists FROM entity_test WHERE entity_id = tcRowId;
    IF tcExists IS NOT NULL AND tcExists > 0 THEN
		-- The test case row id should always be the same as the entity row id.
        -- Don't like doing it this way but use for now.
		SELECT is_element INTO elementId FROM test_bench.entity WHERE id = tcRowId AND is_element > 0;
        IF elementId IS NOT NULL AND elementId > 0 THEN
			SET tcExistsAsElement = TRUE;
		END IF;
    END IF;
    
	RETURN tcExistsAsElement;
END