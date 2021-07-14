CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_test_suites_in_test_run`(IN testRunId INT UNSIGNED)
BEGIN	
    DECLARE testSuiteIds MEDIUMTEXT DEFAULT "";
    DECLARE control INT DEFAULT 10;
            
    TRUNCATE all_test_suite_ids_in_test_run;
    DROP TABLE IF EXISTS elements_have_children;
	CREATE TEMPORARY TABLE elements_have_children 
	SELECT test_suite_row_id AS ts_row_id FROM test_run_has_test_suite WHERE test_run_id = testRunId;
    
    loop_suites_and_elements: LOOP
		DROP TABLE IF EXISTS test_suite_has_children;
		CREATE TEMPORARY TABLE test_suite_has_children 
		WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name, parent_id) AS (
			SELECT 		id, test_suite_id, test_suite_name, parent_id
			FROM 		test_suite ts
			WHERE 		id IN(SELECT ts_row_id FROM elements_have_children) 
            
			UNION ALL
			SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name, chld.parent_id
			FROM 		test_suite chld
			INNER JOIN 	test_suite_has_child_suites c
					ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id		
			)
			SELECT 		ts_has_children.id AS ts_row_id, ent.is_element
			FROM 		test_suite_has_child_suites ts_has_children
			JOIN 		entity ent 
			ON			ent.id = ts_has_children.id
            GROUP BY	ts_has_children.id
            ORDER BY 	ts_has_children.id;
		        
		INSERT INTO all_test_suite_ids_in_test_run(ts_row_id) SELECT ts_row_id FROM test_suite_has_children;
                
		DROP TABLE IF EXISTS elements_have_children;
		CREATE TEMPORARY TABLE elements_have_children 
		WITH RECURSIVE elements_have_child_suites (id, test_suite_id, test_suite_name, parent_id) AS (
			SELECT 		id, test_suite_id, test_suite_name, parent_id
			FROM 		test_suite ts			
			WHERE 		id IN(SELECT is_element FROM test_suite_has_children WHERE is_element > 1 GROUP BY is_element) -- not working when using WHERE id IN(elementIds)
			UNION ALL
			SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name, chld.parent_id
			FROM 		test_suite chld
			INNER JOIN 	elements_have_child_suites c
					ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id		
			)
			SELECT 		ts_has_children.id AS ts_row_id 
			FROM 		elements_have_child_suites ts_has_children			
            GROUP BY	ts_has_children.id
            ORDER BY 	ts_has_children.id;
		
        SELECT GROUP_CONCAT(ts_row_id) INTO testSuiteIds FROM elements_have_children;        
        IF testSuiteIds IS NULL OR control <= 0 THEN
			LEAVE loop_suites_and_elements;		
		ELSE
			-- Save the test suite ids of the element children   
			INSERT INTO all_test_suite_ids_in_test_run(ts_row_id) SELECT ts_row_id FROM elements_have_children;
		END IF;
        
        SET control = control - 1;
	END LOOP loop_suites_and_elements;        
END