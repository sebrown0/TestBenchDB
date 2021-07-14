CREATE DEFINER=`root`@`localhost` PROCEDURE `new_log_entry`(
	IN entryType ENUM('INFO', 'ERROR'), 
	IN entryMSG VARCHAR(1000),
    IN fromRoutine VARCHAR(145) )
BEGIN
	INSERT INTO 
		`test_bench`.`log` (`entry_type`, `entry_msg`, `routine`) 
	VALUES 
		(entryType, entryMSG, fromRoutine);
END