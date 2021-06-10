CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_test_data`(
	IN entityTestRowId INT UNSIGNED,
    IN entityTestId INT UNSIGNED,   
    IN dataIn VARCHAR(1000), 
    IN dataOut VARCHAR(1000), 
    IN dataExpected VARCHAR(1000),
    IN testsFunction VARCHAR(250))
BEGIN
	UPDATE 	entity_test 
    SET 	data_in = dataIn, 
			data_out = dataOut, 
            data_expected = dataExpected,
            test_function = testsFunction
	WHERE	id = entityTestRowId AND entity_test_id = entityTestId;            
END