SELECT * FROM test_bench.test_suite;
SELECT * FROM test_bench.test_suite where test_suite_id = 511;
SELECT * FROM test_bench.test_suite where parent_id = 551;
CALL get_test_suites_children(380);

-- Version
SELECT * FROM test_bench.test_suite_has_version;
SELECT * FROM test_bench.test_suite_has_version where test_suite_id = 554;
SELECT * FROM test_bench.test_suite_has_version where version_id = 859;
select get_max_ver_for_test_suite(511);
select get_max_ver_for_entity_test(550);