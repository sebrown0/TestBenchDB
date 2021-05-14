CREATE DEFINER=`root`@`localhost` PROCEDURE `truncate_test_tables`()
BEGIN
	SET foreign_key_checks = 0;
	DELETE FROM version WHERE version_type = 'TEST' OR version_type = 'TEST_SUITE';
	TRUNCATE test_run;
    TRUNCATE test_run_result;
    TRUNCATE test_run_has_test_suite;
    TRUNCATE test_suite;
    TRUNCATE test_suite_has_version;
    TRUNCATE test_suite_has_entity_test;
    TRUNCATE entity_test;
    TRUNCATE entity_test_has_version;
    TRUNCATE entity_test_result;
    TRUNCATE entity_test_has_one_or_more_test_categories;
    SET foreign_key_checks = 1;
END