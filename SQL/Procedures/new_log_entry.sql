CREATE DEFINER=`root`@`localhost` PROCEDURE `new_log_entry`(
	IN entryType ENUM('INFO', 'ERROR'), 
	IN entryMSG VARCHAR(1000),
    IN fromRoutine VARCHAR(145),
    IN tranGroupNum INT UNSIGNED)
BEGIN
	INSERT INTO 
		`test_bench`.`log` (`entry_type`, `entry_msg`, `routine`, `trans_group_num`) 
	VALUES 
		(entryType, entryMSG, fromRoutine, tranGroupNum);
END