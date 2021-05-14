USE test_bench;
CALL truncate_test_tables();

-- This is added to the version if set, else the default version note is added.
SET @versionNote = "";

TRUNCATE data_test_suite_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_test_suite_insert.csv"
INTO TABLE data_test_suite_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
