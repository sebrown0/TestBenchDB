CREATE VIEW view_test_suites_and_test_cases_in_test_run AS
SELECT 		ts.test_suite_name, get_ver_of_test_suite(ts.id) AS test_suite_version, ts.id AS test_suite_row_id,
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
FROM 		(SELECT ts_row_id FROM all_test_suite_ids_in_test_run ts1 GROUP BY ts_row_id) AS all_in_tr
JOIN		test_suite
			ts
ON			ts.id = all_in_tr.ts_row_id
JOIN 		test_suite_has_entity_test 
			ts_has_test
ON			ts_has_test.test_suite_row_id = ts.id
JOIN		entity_test
			test
ON			test.id = ts_has_test.entity_test_id
JOIN		entity
			ent
ON			ent.id = test.entity_id
JOIN 		entity_details 
			details
ON 			details.id = ent.entity_details_id
LEFT JOIN	entity_help 
			hlp
ON 			hlp.id = ent.entity_help_id;
