CREATE DEFINER=`root`@`localhost` PROCEDURE `create_temp_table_for_tests_in_test_run`(IN testRunId INT UNSIGNED)
BEGIN
		DECLARE tsInTestRunId INT UNSIGNED;
    
	-- Get included suite
	SELECT test_suite_id INTO tsInTestRunId FROM test_run_has_test_suite WHERE test_run_id = testRunId;
	
    IF NOT tsInTestRunId IS NULL AND tsInTestRunId > 0 THEN
		DROP TABLE IF EXISTS top_test;
		CREATE TEMPORARY TABLE top_test
		SELECT 		ts.id AS ts_row_id, ts.test_suite_id, ts.test_suite_name,
					ent.entity_name, ent.id as entity_row_id, ent.entity_id, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element, ent.issue_status_id, 
					test.id as test_id, test.entity_test_id, test.entity_test_name, test.parent_test_row_id, test.parent_test_id
		FROM 		test_suite ts
		JOIN		entity
					ent
		ON			ent.id = ts.id
		JOIN		entity_test
					test
		ON			test.entity_id = ent.id
		WHERE		ts.id = tsInTestRunId;

		DROP TABLE IF EXISTS test_suite_has_children;
		CREATE TEMPORARY TABLE test_suite_has_children 
		WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name) AS (
			SELECT 		id, test_suite_id, test_suite_name
			FROM 		test_suite ts
			WHERE 		id IN(tsInTestRunId) 
			UNION ALL
			SELECT 		chld.id, chld.test_suite_id, chld.test_suite_name
			FROM 		test_suite chld
			INNER JOIN 	test_suite_has_child_suites c
					ON 	c.id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
			INNER JOIN 	test_suite_has_version ts_has_ver
					ON 	ts_has_ver.test_suite_id = chld.id AND ts_has_ver.test_suite_test_suite_id = chld.test_suite_id		
			)
			SELECT 		MAX(ts2.id) AS id, ts2.test_suite_id, ts2.test_suite_name
			FROM 		test_suite_has_child_suites ts1
			INNER JOIN 	test_suite_has_child_suites ts2 
					ON 	ts1.test_suite_id = ts2.test_suite_id
			GROUP BY 	ts2.test_suite_id, ts2.test_suite_id, ts2.test_suite_name
			ORDER BY 	ts2.test_suite_id;
			
		DROP TABLE IF EXISTS child_suites;
		CREATE TEMPORARY TABLE child_suites
		SELECT 		children.id AS ts_row_id , children.test_suite_id, children.test_suite_name, 
					ent.entity_name, ent.id as entity_row_id, ent.entity_id, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, 
					ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element, ent.issue_status_id, 
					test.id as test_id, test.entity_test_id, test.entity_test_name, test.parent_test_row_id, test.parent_test_id
		FROM 		test_suite_has_children 
					children
		JOIN		entity
					ent
		ON			ent.id = children.id
		JOIN		entity_test
					test
		ON			test.entity_id = ent.id;
			
		DROP TABLE IF EXISTS temp_ts_and_tc_in_test_run;
		CREATE TEMPORARY TABLE temp_ts_and_tc_in_test_run	
		SELECT 		children.ts_row_id , children.test_suite_id, children.test_suite_name, 
					ent.entity_name, ent.id as entity_row_id, ent.entity_id, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, 
					ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element, ent.issue_status_id, 
					test.id as test_id, test.entity_test_id, test.entity_test_name, test.parent_test_row_id, test.parent_test_id	 
		FROM 		child_suites 
					children
		JOIN		entity_test
					test
		ON			test.parent_test_row_id = children.ts_row_id
		JOIN 		entity
					ent
		ON			ent.id = test.entity_id
		ORDER BY 	entity_row_id,ts_row_id;

		DROP TABLE IF EXISTS 	all_tests_in_test_run;
        CREATE TEMPORARY TABLE	all_tests_in_test_run
		SELECT * FROM top_test
		UNION ALL
		SELECT * FROM temp_ts_and_tc_in_test_run
		ORDER BY entity_row_id, ts_row_id;
			
		-- Result
		DROP TABLE IF EXISTS 	test_suites_and_test_cases_in_test_run;
		CREATE TEMPORARY TABLE	test_suites_and_test_cases_in_test_run    
		SELECT 		all_in_tr.test_suite_name, get_ver_of_test_suite(all_in_tr.ts_row_id) AS test_suite_version, all_in_tr.ts_row_id AS test_suite_row_id,
					test.id AS entity_test_row_id, test.entity_test_id, test.parent_test_row_id, test.parent_test_id, 
					all_in_tr.entity_row_id, all_in_tr.entity_id,
					all_in_tr.parent_id AS entity_parent_row_id, all_in_tr.parent_entity_id AS entity_parent_entity_id,
					test.entity_test_name, get_ver_of_entity_test(test.id) AS entity_test_version, test.description AS test_description, 
					test.test_function, test.data_in, test.data_out, test.data_expected, 
					test.last_run_date AS test_last_run_date, test.last_run_time AS test_last_run_time, 
					test.created_by_employee_id AS test_created_by, test.failure_halts_test,
					all_in_tr.entity_name, get_ver_of_entity(all_in_tr.entity_row_id) AS entity_version, all_in_tr.entity_type_entity_type_name AS entity_type,
					details.last_tested_date AS entity_last_tested_date, details.last_tested_time AS entity_last_tested_time,
					hlp.has_tool_tip, hlp.tool_tip_text
		FROM 		all_tests_in_test_run 
					all_in_tr
		JOIN	entity_test
					test
		ON			test.entity_id = all_in_tr.entity_row_id
		JOIN 		entity_details 
					details
		ON 			details.id = all_in_tr.entity_details_id
		LEFT JOIN	entity_help 
					hlp
		ON 			hlp.id = all_in_tr.entity_help_id;

	END IF;
END