SELECT * FROM test_bench.entity_type;

set foreign_key_checks = 0;
update test_bench.entity_type set entity_type_name = 'Card Header' where id = 65;
set foreign_key_checks = 1;

SELECT get_parent_entity_type_name_for_entity(169);
-- record type name, row id, ent id for all children added

-- get types parent
SELECT 	etPrnt.entity_type_name
FROM 	entity_type etPrnt
JOIN	entity_type etChld
ON		etChld.entity_type_parent_id = etPrnt.id
WHERE 	etChld.id = 63;

SELECT get_entity_type_id_for_entity_row_id(9021);
SELECT get_parent_entity_type_name(get_entity_type_id_for_entity_row_id(9021));
SELECT get_parent_entity_type_name_for_entity(9022);
SELECT get_parent_entity_type_id(get_entity_type_id_for_entity_row_id(9022));
CALL create_or_update_all_entity_details(
	'152','152','Employee Reports - Card Group TODO','0','Card Group','0','151','151','1','False','-','','',
	'Employee Reports - Card Group','AUTO','1900-01-01','00:00:00','8','Card Group','Container','-','-','-','','1','0','0');