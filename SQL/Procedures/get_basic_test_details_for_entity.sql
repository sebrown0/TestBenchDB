CREATE DEFINER=`root`@`localhost` PROCEDURE `get_basic_test_details_for_entity`(IN entityRowId INT UNSIGNED)
BEGIN
	SELECT 		run.id AS test_run_id,
				ent.id AS entity_id, 
				test.id AS test_id, test.entity_test_name, test.created_on, test.last_run_date,
				test_res.test_passed
	FROM 		entity ent
	JOIN		entity_test 
				test
	ON			ent.id = test.entity_id
    JOIN		entity_test_result
				test_res
	ON			test_res.entity_test_id = test.id
    JOIN		test_suite_has_entity_test 
				ts_has_test
	ON			test.id = ts_has_test.entity_test_id
	LEFT JOIN	test_run_has_test_suite
				tr_has_ts
	ON			tr_has_ts.test_suite_row_id = ts_has_test.test_suite_row_id
	LEFT JOIN	test_run 
				run
	ON			run.id = tr_has_ts.test_run_id    
	WHERE		ent.id = entityRowId;
END