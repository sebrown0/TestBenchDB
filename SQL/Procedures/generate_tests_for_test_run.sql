CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_tests_for_test_run`(IN testRunId INT UNSIGNED, IN filePath VARCHAR(350))
BEGIN
	SET @runName := get_test_run_name_for_file(testRunId);	
    SET @dateAndTime := concat(date_format(CURRENT_DATE,'%d-%m-%Y'), "_", time_format(CURRENT_TIME,'%H%i%S'));
	SET @fileNameAndPath := concat(filePath, "/", "TR_", testRunId, "_", @runName, "_", @dateAndTime, ".csv");	
	
    CALL get_all_test_suites_in_test_run(testRunId);

    SET @q1 := concat("
	SELECT 
			'id', 'test_run_id', 'test_suite_name', 'test_suite_row_id', 'test_suite_version',
            'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes',
            'entity_test_name', 'entity_test_version', 'test_description', 'test_function', 'data_in', 'data_out', 'data_expected', 
            'entity_test_row_id', 'entity_test_id', 'parent_test_row_id', 'parent_test_id', 'entity_row_id', 'entity_id', 'entity_parent_row_id', 'entity_parent_entity_id',             
            'test_last_run_date', 'test_last_run_time', 'failure_halts_test', 
            'entity_name', 'entity_version', 'entity_type', 'entity_last_tested_date', 'entity_last_tested_time', 
            'has_tool_tip', 'tool_tip_text',
			'run_by', 'test_created_by', 'endl'  
            
	UNION ALL
	(
	SELECT 
			'NULL',", testRunId, ", test_suite_name, test_suite_row_id, test_suite_version,
            '', '', '', '',
			entity_test_name, entity_test_version, test_description, test_function, data_in, data_out, data_expected, 
            entity_test_row_id, entity_test_id, parent_test_row_id, parent_test_id, entity_row_id, entity_id, entity_parent_row_id, entity_parent_entity_id,             
            test_last_run_date, test_last_run_time, failure_halts_test, 
            entity_name, entity_version, entity_type, entity_last_tested_date, entity_last_tested_time,             
            has_tool_tip, tool_tip_text,
            'SB_1', test_created_by, 'endl'              
	INTO OUTFILE '", @fileNameAndPath, "'
	FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '' 
	LINES TERMINATED BY '\n'
	FROM view_test_suites_and_test_cases_in_test_run tests);");	                   
                    
    PREPARE s1 FROM @q1;
    EXECUTE s1; DEALLOCATE PREPARE s1;
END