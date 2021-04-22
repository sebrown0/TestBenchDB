USE test_bench;
SET foreign_key_checks = 0;

TRUNCATE version;
TRUNCATE version_to_do;
TRUNCATE version_can_have_version_to_do;
TRUNCATE entity_test_has_version;
TRUNCATE entity_has_version;

TRUNCATE test_suite;
TRUNCATE test_suite_has_entity_test;

TRUNCATE entity;
TRUNCATE entity_details;
TRUNCATE entity_can_have_action;
TRUNCATE entity_action;

-- Employee
TRUNCATE employee_type;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\employee_type.csv"
INTO TABLE employee_type 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE employee;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\employee.csv"
INTO TABLE employee 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE email;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\email.csv"
INTO TABLE email 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Entities
TRUNCATE entity_action_type;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_action_type.csv"
INTO TABLE entity_action_type 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE entity_type;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_type.csv"
INTO TABLE entity_type 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE entity_test_category;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_test_category.csv"
INTO TABLE entity_test_category 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Adding a default test run to run TS 1 (it may not exist)
TRUNCATE test_run;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\test_run.csv"
INTO TABLE test_run 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE test_run_has_test_suite;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\test_run_has_test_suite.csv"
INTO TABLE test_run_has_test_suite 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE data_entity_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_entity_insert.csv"
INTO TABLE data_entity_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE data_entity_action_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_entity_action_insert.csv"
INTO TABLE data_entity_action_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE data_version_to_do;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_version_to_do.csv"
INTO TABLE data_version_to_do 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

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