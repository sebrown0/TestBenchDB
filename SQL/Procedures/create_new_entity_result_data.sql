CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_entity_result_data`(
	IN dataFound MEDIUMTEXT, 
    IN filePath VARCHAR(300), 
    IN imagePath VARCHAR(300))
BEGIN
    INSERT INTO `test_bench`.`entity_test_result_data` (`data_found`, `screen_capture`, `data_file`) 
    VALUES ( dataFound, LOAD_FILE(imagePath), LOAD_FILE(filePath));
END