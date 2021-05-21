SELECT * FROM test_bench.test_run;
SELECT * FROM test_bench.test_suite  ORDER BY id DESC;
SELECT * FROM test_bench.entity_test;
SELECT * FROM test_bench.entity_test ORDER BY id DESC;
SELECT * FROM test_bench.test_run_has_test_suite;
SELECT * FROM test_bench.test_suite_has_entity_test;
SELECT * FROM test_bench.test_run;
SELECT test_run_id, test_suite_row_id, test_suite_id FROM test_run_has_test_suite;
SELECT id, entity_test_id, entity_id, entity_entity_id, entity_test_name,    parent_test_row_id, parent_test_id FROM test_bench.entity_test;
SELECT * FROM test_bench.test_suite WHERE id = 144;

CALL generate_tests_for_test_run('3','C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_bench/data/test_run_files');

CALL get_test_runs();
CALL get_test_suites();
CALL get_test_suites_children(9000);

INSERT INTO `test_bench`.`test_run` (`id`, `test_run_name`, `comments`) VALUES (1, 'Dakar Web - All', NULL);
INSERT INTO `test_bench`.`test_run_has_test_suite` (`test_suite_id`, `test_suite_row_id`, `test_run_id`) VALUES (1, 1, 1);
INSERT INTO `test_bench`.`test_suite_has_entity_test`
(`test_suite_row_id`, `test_suite_id`, `entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) 
VALUES (3, 3, 4, 4, 4, 4);

CALL add_test_case_result('FAIL','FALSE','Test Complete Notes','2','2','2','2','2021-05-15','12:23:28');

CALL create_temp_table_for_tests_in_test_run(1);
SELECT * FROM temp_ts_and_its_children;

select * from temp_test_in_test_run;

SELECT count(*) FROM test_bench.entity_test;
SELECT count(*) FROM test_suite;

/*
CALL generate_headers_for_test_in_test_run();
SELECT * FROM tbl_test_suite_has_child_suites_for_test_run;