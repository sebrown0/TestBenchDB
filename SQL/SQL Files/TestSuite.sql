SELECT * FROM test_bench.test_suite;
SELECT * FROM test_bench.entity_test ORDER BY id DESC;
SELECT MAX(ID) FROM test_bench.entity_test;
 
SELECT * FROM test_bench.test_suite where id > 321 and test_suite_id = 31;
SELECT * FROM test_bench.test_suite where id >= 100000 and id <= 100001;

SELECT * FROM test_bench.test_suite where id = 1540;
SELECT * FROM test_bench.test_suite where parent_id = 30 AND test_suite_id = 31;
SELECT * FROM test_bench.entity_test where parent_test_row_id = 8;
SELECT * FROM test_bench.entity_test where id = 11005;

SELECT * FROM test_bench.entity_test where id >= 100000 and entity_test_id <= 100001;

SELECT * FROM test_suite_has_entity_test where test_suite_id >= 100000 AND test_suite_id < 100001;
SELECT * FROM test_bench.entity_test where id >=321 ORDER BY id;

SELECT * FROM entity_test_has_version where entity_test_id >= 321 AND entity_test_id < 9000 ;
SELECT * FROM entity_test_has_version where VERSION_id = 7;
SELECT * FROM test_suite_has_version where test_suite_id >= 321 AND test_suite_id < 9000 ;
SELECT * FROM test_suite_has_version where test_suite_id = 1539;
SELECT * FROM entity_test_has_version where entity_test_id = 1539;
SELECT * FROM version WHERE id = 7322;
SELECT * FROM test_suite_has_entity_test where test_suite_row_id >= 9000 AND test_suite_row_id < 9000;
SELECT * FROM test_suite_has_entity_test where test_suite_row_id = 1531;
CALL get_test_suites_children(30);
CALL get_test_suites_children(15);

-- Version
SELECT * FROM test_bench.test_suite_has_version;
SELECT * FROM test_bench.test_suite_has_version where test_suite_id = 31;
SELECT * FROM test_bench.test_suite_has_version where version_id = 65;
select get_max_ver_for_test_suite(31);
select get_max_ver_for_entity_test(550);

SELECT * FROM test_bench.test_suite where id in (
352,
431,
435,
439,
443,
447
);

SELECT * FROM entity_test where id in (
1424,
1491,
1518,
1519,
1520
);

SELECT * FROM entity where id in (
1424,
1491,
1518,
1519,
1520
);

/*
-- DELETE
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM test_suite where id >= 321 AND id < 9000;
DELETE FROM test_suite_has_version where test_suite_id >= 321 AND test_suite_id < 9000 ;
DELETE FROM test_suite_has_entity_test where test_suite_row_id >= 321 AND test_suite_row_id < 9000;

DELETE FROM entity_test where id >=321 ORDER BY id AND id < 9000;
DELETE FROM entity_test_has_version WHERE entity_test_id >= 321 AND entity_test_id < 9000;
DELETE FROM test_bench.entity_test_has_one_or_more_test_categories WHERE entity_test_id >= 321 AND entity_test_entity_test_id < 9000;

DELETE FROM version WHERE id >= 924 AND id <= 1377;
SET FOREIGN_KEY_CHECKS=1;
