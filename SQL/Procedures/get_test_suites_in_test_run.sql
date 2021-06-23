CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_suites_in_test_run`(IN trId INT UNSIGNED, INOUT includedTsIds MEDIUMTEXT)
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE tsRowId INT UNSIGNED;
            
    DECLARE curTrHasTs CURSOR FOR     
		WITH RECURSIVE test_suite_has_child_suites (id) AS (
			SELECT 		id
			FROM 		test_suite ts
			WHERE 		id IN(
							SELECT 		ts.id
							FROM 		test_run tr
							INNER JOIN 	test_run_has_test_suite tr_has_ts
									ON 	tr_has_ts.test_run_id = tr.id
							INNER JOIN 	test_suite ts
									ON 	ts.id = tr_has_ts.test_suite_row_id 
							WHERE 		tr.id = trId
						) 
			UNION ALL
			SELECT 		chld.id
			FROM 		test_suite chld
			JOIN 		test_suite_has_child_suites c
			ON 			c.id = chld.parent_id 
		)
		SELECT		MAX(ts2.id) AS id
		FROM 		test_suite_has_child_suites ts1
		JOIN 		test_suite_has_child_suites ts2 
		ON 			ts1.id = ts2.id
		GROUP BY 	ts2.id;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    OPEN curTrHasTs;
    getIds: loop
		FETCH curTrHasTs INTO tsRowId;
        IF finished THEN LEAVE getIds; END IF;        
        SET includedTsIds = CONCAT(includedTsIds, tsRowId, ",");
    END LOOP getIds;
    SET includedTsIds = TRIM(TRAILING ',' FROM includedTsIds);
END