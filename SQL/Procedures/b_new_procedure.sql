CREATE DEFINER=`root`@`localhost` PROCEDURE `b_new_procedure`(IN testRunId INT UNSIGNED)
BEGIN
	CALL get_all_test_suites_in_test_run(testRunId);
    
    DROP TABLE IF EXISTS test_suite_ids;
	CREATE TEMPORARY TABLE test_suite_ids
    SELECT 		ts_row_id	
	FROM 		all_test_suite_ids_in_test_run ts1
	GROUP BY 	ts_row_id;		
    
	DROP TABLE IF EXISTS temp_ts_and_tc_in_test_run;
	CREATE TEMPORARY TABLE temp_ts_and_tc_in_test_run	
	SELECT 		
				ts.id AS ts_row_id, ts.test_suite_id, ts.test_suite_name, 				
				ent.entity_name, ent.id as entity_row_id, ent.entity_id, ent.entity_details_id, ent.entity_type_id, ent.entity_type_entity_type_name, 
				ent.parent_id, ent.parent_entity_id, ent.entity_help_id, ent.is_element, ent.issue_status_id,
				test.id as test_id, test.entity_test_id, test.entity_test_name, test.parent_test_row_id, test.parent_test_id	 
	FROM 		test_suite_ids 
				all_suites
	JOIN		test_suite
				ts
	ON			ts.id = all_suites.ts_row_id
    JOIN 		test_suite_has_entity_test 
				ts_has_test
	ON			ts_has_test.test_suite_row_id = ts.id
	JOIN		entity_test
				test
	ON			test.id = ts_has_test.entity_test_id
	JOIN		entity
				ent
	ON			ent.id = test.entity_id
	ORDER BY 	ent.id, ts.id;

END