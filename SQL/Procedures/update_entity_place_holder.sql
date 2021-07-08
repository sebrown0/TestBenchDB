CREATE DEFINER=`root`@`localhost` PROCEDURE `update_entity_place_holder`(
	IN placeHolderName VARCHAR(100),     
	IN placeHolderTypeName VARCHAR(100))
BEGIN
	DECLARE placeHolderTypeId INT UNSIGNED;
    SELECT id INTO placeHolderTypeId FROM place_holder_type WHERE place_holder_type_name = placeHolderTypeName;
    
    IF placeHolderTypeId IS NOT NULL AND placeHolderTypeId > 0 THEN
		INSERT INTO 
			`test_bench`.`place_holders` (`place_holder_name`, `place_holder_type_id`, `place_holder_type_name`)
		VALUES 	
			(placeHolderName,placeHolderTypeId,placeHolderTypeName)
		ON DUPLICATE KEY UPDATE
			place_holder_name = placeHolderName,
			place_holder_type_id = placeHolderTypeId,
			place_holder_type_name = placeHolderTypeName;
	END IF;
END