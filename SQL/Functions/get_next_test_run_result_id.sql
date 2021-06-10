CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_test_run_result_id`() RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE maxTrId INT UNSIGNED;
    
	SELECT 	max(tr_res.id) 
    INTO 	maxTrId
    FROM 	test_run_result tr_res;
    
    IF maxTrId IS NULL THEN
		SET maxTrId = 0;
    END IF;
    
	RETURN maxTrId + 1;
END