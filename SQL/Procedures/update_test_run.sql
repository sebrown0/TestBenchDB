CREATE DEFINER=`root`@`localhost` PROCEDURE `update_test_run`(
	IN testRunId INT UNSIGNED,
	IN testRunName VARCHAR(100),
    IN cmnts VARCHAR(1000))
BEGIN
	UPDATE 	test_run
	SET  	test_run_name = testRunName, comments = cmnts
	WHERE	id = testRunId;     
END