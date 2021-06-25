SELECT * FROM test_run;
SELECT test_run_id, test_suite_row_id, test_suite_id FROM test_run_has_test_suite;
SELECT * FROM test_suite  ORDER BY id DESC;
SELECT * FROM test_suite where id = 31;
SELECT * FROM entity_test  where id = 7;
SELECT * FROM entity_test  where entity_test_id = 1075;
SELECT * FROM entity_test WHERE entity_test_name ='User Management - Dakinet Form - Button - Display - DKGrid - DkGrToolbar - DkGrTbSaveGrid';

SELECT * FROM entity_test ORDER BY id DESC;
SELECT * FROM entity_test where id >=321 ORDER BY id;
SELECT * FROM entity_test where entity_id = 713;

SELECT * FROM test_suite_has_entity_test;

SELECT test_run_id, test_suite_row_id, test_suite_id FROM test_run_has_test_suite;
SELECT id, entity_test_id, entity_id, entity_entity_id, entity_test_name,    parent_test_row_id, parent_test_id FROM test_bench.entity_test;
SELECT * FROM test_bench.test_suite WHERE id = 144;

CALL get_basic_test_details_for_entity(713);
CALL get_last_run_test_and_test_run();

-- CALL generate_tests_for_test_run('10','C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_bench/data/test_run_files');
-- CALL create_temp_table_for_tests_in_test_run(11);
select @@sql_mode;

/*
CALL delete_test_suites_and_tests(0,0);


CALL get_test_runs();
CALL get_test_suites();
CALL get_test_suites_children(16);

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