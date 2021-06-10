CREATE DEFINER=`root`@`localhost` PROCEDURE `create_temp_table_for_tests_in_test_run`(IN testRunId INT UNSIGNED)
BEGIN
	-- Get all the test suites in a test run
	DROP TABLE IF EXISTS test_run_has_test_suites;
	CREATE TEMPORARY TABLE test_run_has_test_suites WITH RECURSIVE test_suite_has_child_suites (id, test_suite_id, test_suite_name) AS (
		SELECT 		id, test_suite_id, test_suite_name
		FROM 		test_suite ts
		WHERE 		id IN(
						SELECT 		ts.id
						FROM 		test_run tr
						INNER JOIN 	test_run_has_test_suite tr_has_ts
								ON 	tr_has_ts.test_run_id = tr.id
						INNER JOIN 	test_suite ts
								ON 	ts.id = tr_has_ts.test_suite_row_id AND ts.test_suite_id = tr_has_ts.test_suite_id						
                        WHERE 		tr.id = testRunId
					) 
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
    
    -- Add the test cases to the included test suites
    DROP TABLE IF EXISTS 	test_run_has_test_suites_and_test_cases;
    CREATE TEMPORARY TABLE	test_run_has_test_suites_and_test_cases
	SELECT 			MAX(test.id) AS id, tr_has_ts.test_suite_name
	FROM 			test_run_has_test_suites 
					tr_has_ts	
	INNER JOIN 		test_suite_has_entity_test 
					ts_has_test
			ON		ts_has_test.test_suite_row_id = tr_has_ts.id 
	INNER JOIN 		entity_test 
					test
			ON		test.id = ts_has_test.entity_test_id AND test.entity_test_id = ts_has_test.entity_test_entity_test_id
    GROUP BY		test.entity_test_id, tr_has_ts.test_suite_name
    ORDER BY 		test.id;	

	-- Get the details of the tests
	DROP TABLE IF EXISTS 	test_suites_and_test_cases_in_test_run;
    CREATE TEMPORARY TABLE	test_suites_and_test_cases_in_test_run
    
	SELECT 			tr_has_ts_and_tc.test_suite_name, get_ver_of_test_suite(tr_has_ts_and_tc.id) AS test_suite_version, tr_has_ts_and_tc.id AS test_suite_row_id,
					test.id AS entity_test_row_id, test.entity_test_id, test.parent_test_row_id, test.parent_test_id, 
                    ent.id AS entity_row_id, ent.entity_id,
                    ent.parent_id AS entity_parent_row_id, ent.parent_entity_id AS entity_parent_entity_id, 
                    test.entity_test_name, get_ver_of_entity_test(test.id) AS entity_test_version, test.description AS test_description, 
                    test.test_function, test.data_in, test.data_out, test.data_expected, 
                    test.last_run_date AS test_last_run_date, test.last_run_time AS test_last_run_time, 
                    test.created_by_employee_id AS test_created_by, test.failure_halts_test,                    
					ent.entity_name, get_ver_of_entity(ent.id) AS entity_version, ent.entity_type_entity_type_name AS entity_type,
                    details.last_tested_date AS entity_last_tested_date, details.last_tested_time AS entity_last_tested_time,
                    hlp.has_tool_tip, hlp.tool_tip_text
    FROM 			test_run_has_test_suites_and_test_cases 
					tr_has_ts_and_tc
    INNER JOIN 		entity_test 
					test
			ON		test.id = tr_has_ts_and_tc.id
	INNER JOIN 		entity_test_has_version
					ent_test_has_ver
			ON		ent_test_has_ver.entity_test_id = test.id AND ent_test_has_ver.entity_test_entity_test_id = test.entity_test_id
	INNER JOIN		version 
					test_ver
			ON		test_ver.id = ent_test_has_ver.version_id
	INNER JOIN 		entity 
					ent
			ON		ent.id = test.entity_id AND ent.entity_id = test.entity_entity_id
	INNER JOIN 		entity_details 
					details
			ON 		details.id = ent.entity_details_id
    INNER JOIN 		entity_help 
					hlp
			ON 		hlp.id = ent.entity_help_id;
END