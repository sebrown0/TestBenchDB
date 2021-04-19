-- Employee
SELECT * FROM test_bench.employee_type;
SELECT * FROM test_bench.employee;
SELECT * FROM test_bench.email;

-- Entities
SELECT * FROM test_bench.version;

SELECT * FROM test_bench.entity_type;
SELECT * FROM test_bench.entity_has_version;
SELECT * FROM test_bench.entity;
SELECT * FROM test_bench.entity_details;
SELECT * FROM test_bench.entity_can_have_action;
SELECT * FROM test_bench.entity_action;
SELECT * FROM test_bench.version_can_have_version_to_do;

SELECT * FROM test_bench.entity_test_category;
SELECT * FROM test_bench.entity_test_has_version;
SELECT * FROM test_bench.entity_test;

-- Test
SELECT * FROM test_bench.test_run;
SELECT * FROM test_bench.test_run_has_test_suite_of_entity_tests;
