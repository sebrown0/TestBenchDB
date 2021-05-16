CREATE DEFINER=`root`@`localhost` PROCEDURE `create_temp_table_for_tests_in_test_run`(IN testRunId INT UNSIGNED)
BEGIN
	DROP TABLE IF EXISTS tbl_test_suite_has_child_suites_for_test_run;
	CREATE TABLE 	tbl_test_suite_has_child_suites_for_test_run WITH RECURSIVE test_suite_has_child_suites (test_suite_row_id, test_suite_id) AS (
		SELECT 		id AS test_suite_row_id, test_suite_id
		FROM 		test_suite 
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
		SELECT 		chld.id, chld.test_suite_id
		FROM 		test_suite chld
		INNER JOIN 	test_suite_has_child_suites c
				ON 	c.test_suite_row_id = chld.parent_id AND c.test_suite_id = chld.parent_test_suite_id	
	)
	SELECT 			ts_has_test.test_suite_row_id as test_suite_row_id, ts_has_test.test_suite_id, 
					ts_has_test.entity_test_id, ts_has_test.entity_test_entity_test_id                    
	FROM 			test_suite_has_child_suites ts_has_chld
	INNER JOIN 		test_suite_has_entity_test ts_has_test
			ON 		ts_has_chld.test_suite_row_id = ts_has_test.test_suite_row_id AND ts_has_chld.test_suite_id = ts_has_test.test_suite_id;

	DROP TABLE IF EXISTS temp_test_in_test_run;
	CREATE TABLE 	temp_test_in_test_run 
	WITH RECURSIVE 	test_has_children (id, test_id) AS (
		SELECT 		id, entity_test_id
		FROM 		entity_test 
		WHERE 		id IN (SELECT test_suite_row_id FROM tbl_test_suite_has_child_suites_for_test_run)
		UNION ALL
		SELECT 		chld.id, chld.entity_test_id
		FROM 		entity_test chld
		INNER JOIN 	test_has_children tst_has_chld
				ON 	tst_has_chld.id = chld.parent_test_row_id AND tst_has_chld.test_id = chld.parent_test_id            
	)	
		SELECT 		ts_has_child_suites_for_tr.`test_suite_row_id`, ts_has_child_suites_for_tr.test_suite_id, 					
					tst.id AS entity_test_row_id, tst.entity_test_id,
                    tst.entity_id, tst.entity_entity_id, tst.entity_test_name, 
                    get_ver_num(test_has_version.version_id) AS `version_number` , 
                    tst.description, tst.created_on,   
                    tst.test_function, tst.data_in, tst.data_out, tst.data_expected, 
                    tst.failure_halts_test, tst.created_by_employee_id, tst.last_run_date, tst.last_run_time, tst.parent_test_row_id, tst.parent_test_id,
                    ent.entity_type_entity_type_name, ent.`entity_name`,
                    det.last_tested_date, det.last_tested_time,
                    hlp.has_tool_tip, hlp.tool_tip_text
		FROM 		test_has_children    
		INNER JOIN 	entity_test tst
				ON 	tst.entity_test_id = test_has_children.test_id            
		INNER JOIN 	entity ent
				ON  ent.id = tst.entity_id AND ent.entity_id = tst.entity_entity_id
		INNER JOIN 	entity_details det
				ON 	det.id = ent.entity_details_id AND det.entity_id = ent.id
		LEFT JOIN	entity_help hlp 
				ON  hlp.id = ent.entity_help_id AND hlp.entity_id = ent.id
		 LEFT JOIN 	entity_test_has_version test_has_version
				ON 	test_has_version.entity_test_id = tst.id AND test_has_version.entity_test_entity_test_id = tst.entity_test_id
		 LEFT JOIN	tbl_test_suite_has_child_suites_for_test_run ts_has_child_suites_for_tr
				ON 	ts_has_child_suites_for_tr.entity_test_id = tst.id AND ts_has_child_suites_for_tr.entity_test_entity_test_id = tst.entity_test_id         
		 LEFT JOIN 	test_suite ts 
				ON 	ts.id = ts_has_child_suites_for_tr.test_suite_row_id AND ts.test_suite_id = ts_has_child_suites_for_tr.test_suite_id	  
		  ORDER BY  tst.id;
END