SELECT * FROM entity_has_version;
SELECT * FROM version ORDER BY id DESC;
SELECT * FROM version WHERE version_type = 'ENTITY' AND entity_name = 'Employee List';
SELECT * FROM version WHERE version_type = 'TEST' AND entity_name = 'Top Level of: Bulk Updates - COLA Salary Updates';
SELECT * FROM version WHERE version_type = 'TEST' AND entity_name = 'Top Level of: Bulk Updates - COLA Salary Updates';
SELECT * FROM version WHERE version_type = 'TEST_SUITE' AND id > 800;
SELECT * FROM version WHERE version_type = 'ENTITY' AND id > 400 LIMIT 500;
SELECT * FROM version WHERE id = '1254';
SELECT * FROM version WHERE id >= 924 AND id <= 1377;
SELECT * FROM version WHERE id = 1378;

SELECT * FROM test_bench.entity_has_version WHERE version_id = 753;
SELECT * FROM test_bench.entity_has_version WHERE entity_entity_id = 33;
SELECT * FROM test_bench.entity_has_version WHERE entity_entity_id > 300 order by version_id desc, entity_entity_id;
SELECT * FROM test_suite_has_version WHERE test_suite_id = 391;

CALL get_version_info_for_entity(511);
SELECT get_max_ver_for_test_suite(31);
SELECT get_ver_of_entity_test(321);
SELECT get_ver_of_entity(321);
SELECT get_ver_of_test_suite(321);

SELECT get_max_ver_for_entity(376);

SELECT 		ent.id, ent.entity_id -- , ver.major, ver.minor, ver.build, ver.version_note 
FROM 		test_bench.entity ent
INNER JOIN	entity_has_version has_ver
		ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
/*INNER JOIN 	version ver 
		ON 	ver.id = has_ver.version_id*/
WHERE 		ent.entity_id = 321;