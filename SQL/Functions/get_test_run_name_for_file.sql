CREATE DEFINER=`root`@`localhost` FUNCTION `get_test_run_name_for_file`(testRunId INT UNSIGNED) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN	
	DECLARE runName VARCHAR(100);
    
    SELECT test_run_name INTO runName FROM test_run WHERE id = testRunId LIMIT 1;
    IF length(runName) > 20 THEN
		SET runName = left(runName,20);
    END IF;
	RETURN runName;
END