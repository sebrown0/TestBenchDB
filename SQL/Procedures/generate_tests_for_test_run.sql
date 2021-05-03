CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_tests_for_test_run`(IN testRunId INT UNSIGNED, IN filePath VARCHAR(350))
BEGIN
	SET @dat := now();	
    SET @dateAndTime := concat(day(@dat), "-", month(@dat), "-", year(@dat), "_", hour(@dat), ";", minute(@dat), ";", second(@dat));
	SET @fileNameAndPath := concat(filePath, "/", "TR_", testRunId, "_", @dateAndTime, ".csv");
	SET @cte := concat(
	"WITH RECURSIVE cteTestSuitesInTestRun (test_suite_id) AS (
	  SELECT     ts.test_suite_id
	  FROM       test_run tr
	  INNER JOIN test_run_has_test_suite has
			  ON tr.id = has.test_run_id
	  INNER JOIN test_suite ts
			  ON ts.test_suite_id = has.test_suite_id
	  WHERE      tr.id = ", testRunId, "
	  UNION ALL
	  SELECT     t.test_suite_id			 
	  FROM       test_suite t
	  INNER JOIN cteTestSuitesInTestRun
			  ON t.test_suite_parent_id = cteTestSuitesInTestRun.test_suite_id
	)");    
    
    SET @q1 := concat("
	SELECT 
		'id', 'test_run_id', 'test_suite_id', 
		'entity_test_id', 'entity_test_parent', 'entity_test_version_id', 'entity_test_version_num', 'entity_test_name', 'entity_test_description', 
		'entity_id', 'entity_name', 'entity_type_name',
		'entity_description', 'entity_last_tested_date', 'entity_last_tested_time',	
        'has_tool_tip', 'tool_tip_text',
		'initial_value', 'expected_value', 'received_value', 'insert_value', 'failure_halts_test',
		'run_by', 'pass_fail_or_not_run', 'fail_severity', 'fail_reason', 'test_complete_notes' 
	UNION ALL
	(
	SELECT 
		'NULL',", testRunId, ",cteTestSuitesInTestRun.test_suite_id, 		
		tst.entity_test_id, tst.entity_test_parent, tst.entity_test_version_id, 
		get_ver_num(tst.entity_test_version_id) AS entity_test_version_num, tst.entity_test_name, tst.description,		
		et.entity_id, et.entity_name, et.entity_type_entity_type_name,     
		ed.description, ed.last_tested_date, ed.last_tested_time,	
        hlp.has_tool_tip, hlp.tool_tip_text,
		tst.initial_value, tst.expected_value, tst.received_value, tst.insert_value, tst.failure_halts_test,
		'SB_1', 'NR', 'NULL','NULL', 'Test completed notes.' 
	INTO OUTFILE '", @fileNameAndPath, "'
	FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '' 
	LINES TERMINATED BY '\n'
	FROM cteTestSuitesInTestRun
		INNER JOIN test_suite_has_entity_test has_test
				ON cteTestSuitesInTestRun.test_suite_id = has_test.test_suite_id        
		INNER JOIN entity_test tst
				ON tst.entity_test_id = has_test.entity_test_id
		INNER JOIN entity_test_has_version tst_has_ver
				ON tst_has_ver.entity_test_id = tst.entity_test_id
		INNER JOIN version ver 
				ON ver.id = tst_has_ver.version_id
		INNER JOIN entity et 
				ON tst.entity_id = et.entity_id		
		INNER JOIN entity_help hlp
				ON hlp.id = et.entity_help_id
		INNER JOIN entity_details ed 
				ON ed.id = et.entity_type_details_id  
		  ORDER BY et.entity_id, tst.entity_test_id, tst.entity_test_parent, cteTestSuitesInTestRun.test_suite_id);");
	
    SET @q2 := concat(@cte,@q1);    
    PREPARE s1 FROM @q2;
    EXECUTE s1; DEALLOCATE PREPARE s1;
END