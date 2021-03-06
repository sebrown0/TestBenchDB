SET @NUM_IGNORED_TESTS = 0;
SET @NUM_FAILED_TESTS = 0;
SET @NUM_PASSED_TESTS = 0;
SET @NUM_TESTS_RUN = 0;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_bench/data/test_run_files/x.csv"
INTO TABLE import_test_result 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Below set in trigger: import_test_result_AFTER_INSERT 
-- @IMPORT_TEST_RUN_ID_RESULT & @IMPORT_TEST_RUN_BY_EMP_ID = NEW.run_by; 
CALL add_test_run_result(
	@IMPORT_TEST_RUN_ID_RESULT,
    @IMPORT_TEST_RUN_BY_EMP_ID,
    @NUM_TESTS_RUN,
    @NUM_FAILED_TESTS,
    @NUM_PASSED_TESTS,
    @NUM_IGNORED_TESTS,
    NULL);

SELECT @NUM_IGNORED_TESTS, @NUM_FAILED_TESTS, @NUM_PASSED_TESTS, @NUM_TESTS_RUN;


