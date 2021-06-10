CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_case_result`(
	IN testPassed ENUM('Pass', 'Fail', 'NR','QP'),
    IN failSeverity TINYINT,
    IN failReason VARCHAR(1000),
    IN testInored ENUM('TRUE', 'FALSE'),
    IN testComments TEXT,
    IN entityTestRowId INT UNSIGNED,
    IN entityTestId INT UNSIGNED,     
    IN entityRowId INT UNSIGNED,
    IN entityId INT UNSIGNED,
    IN dateRun DATE,
    IN timeRun TIME,
    IN hasResultData TINYINT,
    IN resultDataText MEDIUMTEXT,
    IN resultDataFileFP VARCHAR(300),
    IN resultDataScreenShotFP VARCHAR(300),
	IN dataIn VARCHAR(1000), 
    IN dataOut VARCHAR(1000), 
    IN dataExpected VARCHAR(1000),
    IN testsFunction VARCHAR(250),
    IN testRunId INT UNSIGNED,
    IN testRunResultId INT UNSIGNED)
BEGIN 
	DECLARE resultDataId INT UNSIGNED DEFAULT NULL;
    
	IF hasResultData THEN
		CALL create_new_entity_result_data(resultDataText, resultDataFileFP, resultDataScreenShotFP);	
        SET resultDataId = (SELECT max(id) FROM entity_test_result_data GROUP BY id LIMIT 1);
    END IF;
        
	INSERT INTO `test_bench`.`entity_test_result` (
		`result_timestamp`, `test_passed`, `fail_severity`, `fail_reason`, `test_ignored`, `comments`, 
        `entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`,
        `test_run_result_id`, `test_run_result_test_run_id`,`entity_test_result_data_id`) 
	VALUES (
		current_time(), testPassed, failSeverity, failReason, testInored, testComments, 
        entityTestRowId, entityTestId, entityRowId, entityId, testRunResultId, testRunId, resultDataId);
		
    CALL update_entity_test_last_run(entityTestRowId, entityTestId, entityRowId, entityId, dateRun, timeRun);
    CALL update_entity_last_tested(entityRowId, entityId, dateRun, timeRun);
    CALL update_entity_test_data(entityTestRowId, entityTestId, dataIn, dataOut, dataExpected, testsFunction);
END