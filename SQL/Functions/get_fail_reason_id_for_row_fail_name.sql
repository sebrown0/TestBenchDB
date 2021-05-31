CREATE DEFINER=`root`@`localhost` FUNCTION `get_fail_reason_id_for_row_fail_name`(failReason VARCHAR(500)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	DECLARE failReasonId INT DEFAULT 0;
    
    SELECT id INTO failReasonId FROM entity_type_fail_reason WHERE fail_reason = failReason;
	RETURN failReasonId;
END