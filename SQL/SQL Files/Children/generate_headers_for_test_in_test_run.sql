CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_headers_for_test_in_test_run`()
BEGIN
	SELECT 	"id, test_run_id,
			entity_test_row_id, entity_test_id, version_number, 
			entity_id, entity_entity_id, entity_test_name, description, created_on, 
            test_function, data_in, data_out', data_expected, 
            failure_halts_test, created_by_employee_id, last_run_date, last_run_time, parent_test_row_id, parent_test_id,
            pass_fail_or_not_run', fail_severity, fail_reason', test_complete_notes, endl" ;
            
            /*
SELECT 	'id', 'test_run_id',
			'entity_test_row_id', 'entity_test_id', 'version_number', 
			'entity_id', 'entity_entity_id', 'entity_test_name', 'description', 'created_on', 
            'test_function', 'data_in', 'data_out', 'data_expected', 
            'failure_halts_test', 'created_by_employee_id', 'last_run_date', 'last_run_time', 'parent_test_row_id', 'parent_test_id',
            'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes', 'endl' ;
            */
END