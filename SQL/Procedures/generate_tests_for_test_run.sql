CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_tests_for_test_run`(IN testRunId INT UNSIGNED, IN filePath VARCHAR(350))
BEGIN
	SET @runName := get_test_run_name_for_file(testRunId);	
    SET @dateAndTime := concat(date_format(CURRENT_DATE,'%d-%m-%Y'), "_", time_format(CURRENT_TIME,'%H%i%S'));
	SET @fileNameAndPath := concat(filePath, "/", "TR_", testRunId, "_", @runName, "_", @dateAndTime, ".csv");	
	
	CALL create_temp_table_for_tests_in_test_run(testRunId);
    
    SET @q1 := concat("
	SELECT 
			'id', 'test_run_id', 'test_suite_name', 'test_suite_row_id', 'test_suite_id',
            'entity_test_row_id', 'entity_test_id', 'version_number', 
            'entity_id', 'entity_entity_id', 'entity_name', 'entity_type',
            'entity_last_tested_date', 'entity_last_tested_time',
            'entity_test_name', 'description', 'created_on', 
            'test_function', 'data_in', 'data_out', 'data_expected', 
            'has_tool_tip', 'tool_tip_text',
            'failure_halts_test', 'created_by_employee_id', 'last_run_date', 'last_run_time', 'parent_test_row_id', 'parent_test_id',            
			'run_by', 'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes', 'endl'  
	UNION ALL
	(
	SELECT 
			'NULL',", testRunId, ", test_suite_name, test_suite_row_id, test_suite_id,
			entity_test_id, entity_test_id, version_number, 
			entity_id, entity_entity_id, 
            entity_name, entity_type_entity_type_name,
            last_tested_date, last_tested_time,
            entity_test_name, description, created_on, 
            test_function, data_in, data_out, data_expected, 
            has_tool_tip, tool_tip_text,
            failure_halts_test, created_by_employee_id, last_run_date, last_run_time, parent_test_row_id, parent_test_id,
            'SB_1', '', '', '', 'Test Complete Notes', 'NULL'  	
	INTO OUTFILE '", @fileNameAndPath, "'
	FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '' 
	LINES TERMINATED BY '\n'
	FROM temp_ts_and_its_children tests);");	                   
                    
    PREPARE s1 FROM @q1;
    EXECUTE s1; DEALLOCATE PREPARE s1;
END