USE test_bench;
SET foreign_key_checks = 0;

-- This is added to the version if set, else the default version note is added.
SET @versionNote = "";

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
/*
TRUNCATE data_version_to_do;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\initial_data\\data_version_to_do.csv"
INTO TABLE data_version_to_do 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
SET foreign_key_checks = 1;