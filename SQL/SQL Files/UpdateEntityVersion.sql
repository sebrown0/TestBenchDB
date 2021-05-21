SET @i = 151;
SET @n = (SELECT entity_type_entity_type_name FROM entity WHERE id = @i);
SELECT * FROM test_bench.entity WHERE id = @i;
CALL create_or_update_entity_version(@i,@i, @n,'',1,0,0);

SELECT * FROM test_bench.version WHERE version_type = 'ENTITY' AND entity_name = @n;
SELECT * FROM test_bench.entity_has_version WHERE version_id = 446;
SELECT entity_type_entity_type_name FROM entity WHERE id = @i;