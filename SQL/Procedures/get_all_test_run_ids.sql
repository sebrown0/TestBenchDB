CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_test_run_ids`()
BEGIN
    SELECT 
		id
    FROM 
		test_run
	ORDER BY 
		id;
END