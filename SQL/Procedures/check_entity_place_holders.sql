CREATE DEFINER=`root`@`localhost` PROCEDURE `check_entity_place_holders`(    
	IN entityActionDataIn TEXT,
    IN entityActionDataOut TEXT,
    IN entityActionDataExpected TEXT)
BEGIN
	IF is_place_holder(left(entityActionDataIn,100)) THEN CALL update_entity_place_holder(left(entityActionDataIn,100), 'In'); END IF;
    IF is_place_holder(left(entityActionDataOut,100)) THEN CALL update_entity_place_holder(left(entityActionDataOut,100), 'Out'); END IF;
    IF is_place_holder(left(entityActionDataExpected,100)) THEN CALL update_entity_place_holder(left(entityActionDataExpected,100), 'Expected'); END IF;
END