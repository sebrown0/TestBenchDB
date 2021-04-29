USE test_bench;
SET foreign_key_checks = 0;

TRUNCATE data_test_suite_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_test_suite_insert.csv"
INTO TABLE data_test_suite_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE data_entity_test_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_entity_test_insert.csv"
INTO TABLE data_entity_test_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET foreign_key_checks = 1;
