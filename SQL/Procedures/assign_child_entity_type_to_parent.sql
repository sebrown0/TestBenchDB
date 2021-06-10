CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_child_entity_type_to_parent`()
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE typeId INT UNSIGNED;
    DECLARE entityTypeName VARCHAR(100);
    DECLARE entityTypeParentId INT UNSIGNED;
    DECLARE children VARCHAR (500);
    DECLARE childForEntityTypeId INT UNSIGNED;

	DECLARE curEntType CURSOR FOR SELECT * FROM entity_type;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN curEntType;
    get_types:LOOP
		FETCH curEntType INTO typeId, entityTypeName, entityTypeParentId, children;
        IF finished = 1 THEN LEAVE get_types; END IF;
        
        SET childForEntityTypeId = child_for_entity_type_id(entityTypeParentId, typeId);
        IF childForEntityTypeId IS NULL THEN
			INSERT INTO `test_bench`.`entity_type_has_child` (
				`child_entity_type_id`, `entity_type_child_name`, `parent_entity_type_id`, `entity_type_parent_name`) 
			VALUES (
				typeId, get_entity_type_name_for_id(typeId), entityTypeParentId, get_entity_type_name_for_id(entityTypeParentId));
        END IF;
    END LOOP get_types;
END