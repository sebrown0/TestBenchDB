SELECT * FROM entity_has_version;
SELECT * FROM version ORDER BY id DESC;
SELECT * FROM version WHERE version_type = 'ENTITY' AND entity_name = 'Employee List';
SELECT * FROM version WHERE version_type = 'ENTITY' AND id < 9000;
SELECT * FROM version WHERE id = 753;
SELECT * FROM version WHERE id = 724 or id = 729;

SELECT * FROM test_bench.entity_has_version WHERE version_id = 753;
SELECT * FROM test_bench.entity_has_version WHERE entity_entity_id = 33;
SELECT * FROM test_bench.entity_has_version WHERE entity_entity_id > 300 order by version_id desc, entity_entity_id;

CALL get_version_info_for_entity(31);

SELECT 		ent.id, ent.entity_id -- , ver.major, ver.minor, ver.build, ver.version_note 
FROM 		test_bench.entity ent
INNER JOIN	entity_has_version has_ver
		ON 	has_ver.entity_id = ent.id AND has_ver.entity_entity_id = ent.entity_id
/*INNER JOIN 	version ver 
		ON 	ver.id = has_ver.version_id*/
WHERE 		ent.entity_id = 321;