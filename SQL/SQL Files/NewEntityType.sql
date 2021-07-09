-- 0 
-- SET VARS
SET @entTypeId = get_next_entity_type_id();
SET @entTypeName = 'Generic Buttons';
SET @entTypePrntId = 1; 						-- 1 = Root
SET @entTypeHasChildren = NULL;					-- string '1,99,129 etc' ** CAN BE NULL **
SET @assignDefltFailReasons = TRUE;

-- 1
-- Add entity's iEntityAction in WB AND Update is test suite/case in WB
-- 2
-- Add entity_type and entity_type_has_child
-- 3
-- Add new entity_type_fail_reason (if necesssary) AND entity_type_has_fail_reason
/* ************************************************************************** */
/* IF NOT USING DEFAULT OR FAIL REASON DOES NOT EXIST HAVE TO CREATE MANUALLY */
/* ************************************************************************** */
CALL create_new_entity_type(@entTypeId, @entTypeName, @entTypePrntId, @entTypeHasChildren, @assignDefltFailReasons); 
CALL assign_child_entity_type_to_parent();
-- 4
-- ***************************************** **
-- Create test suite/case for the new entity **
-- ***************************************** **

-- Helpers
-- SELECT * FROM entity_type_fail_reason;
-- SELECT * FROM entity_type_has_fail_reason;
-- SELECT * FROM entity_type;
-- SELECT id, parent_entity_type_id, entity_type_parent_name, child_entity_type_id, entity_type_child_name FROM entity_type_has_child WHERE parent_entity_type_id = 51;