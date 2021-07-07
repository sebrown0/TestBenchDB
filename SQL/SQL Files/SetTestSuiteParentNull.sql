SET FOREIGN_KEY_CHECKS = 0;
UPDATE test_bench.test_suite SET parent_id = NULL,parent_test_suite_id = NULL where id = 12010;
SET FOREIGN_KEY_CHECKS = 1;