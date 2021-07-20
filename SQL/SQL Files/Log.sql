SELECT * FROM log ORDER BY id desc;

SELECT * FROM log WHERE trans_group_num = 428  ORDER BY id;

-- SELECT get_next_log_trans_group();

-- TRUNCATE log;
-- DELETE FROM log WHERE trans_group_num = 0 AND id > 0;

CALL create_new_test_suite('12546','12546','Form - Employee Tax Arrears + Tab - Statistics + Table','Check all elements of the table are displayed correctly.','12544','12544');