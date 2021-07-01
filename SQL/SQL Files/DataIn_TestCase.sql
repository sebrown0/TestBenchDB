USE test_bench;

-- This is added to the version if set, else the default version note is added.
SET @versionNote = "";

TRUNCATE data_entity_test_insert;
LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\test_bench\\data\\import\\data_entity_test_insert.csv"
INTO TABLE data_entity_test_insert 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- select @versionNote;
