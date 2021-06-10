CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_test_run_result_id_for_tr`(
    trId INT UNSIGNED) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE maxTrId INT UNSIGNED;
    
	SELECT 	max(tr_res.id) 
    INTO 	maxTrId
    FROM 	test_run_result tr_res 
    WHERE 	tr_res.test_run_id = trId;
    
	RETURN maxTrId;
END