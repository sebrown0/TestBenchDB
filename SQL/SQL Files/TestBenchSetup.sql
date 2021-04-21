USE test_bench;
SET foreign_key_checks = 0;

TRUNCATE entity_details;
TRUNCATE version;
TRUNCATE version_to_do;
TRUNCATE version_can_have_version_to_do;
TRUNCATE entity;
TRUNCATE entity_has_version;
TRUNCATE entity_can_have_action;
TRUNCATE entity_action;
TRUNCATE data_entity_action_insert;
TRUNCATE data_entity_insert;
TRUNCATE data_version_to_do;

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

TRUNCATE entity_test_has_version;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_test_has_version.csv"
INTO TABLE entity_test_has_version 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE entity_test;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_test.csv"
INTO TABLE entity_test 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE entity_test_has_one_or_more_test_categories;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\entity_test_has_one_or_more_test_categories.csv"
INTO TABLE entity_test_has_one_or_more_test_categories 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE test_run_has_test_suite_of_entity_tests;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\test_run_has_test_suite_of_entity_tests.csv"
INTO TABLE test_run_has_test_suite_of_entity_tests 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE test_run;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\test_run.csv"
INTO TABLE test_run 
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

SET foreign_key_checks = 1;