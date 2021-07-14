CALL update_entity_name('Controller - Employee Schedule -','Controller - Employee Schedule +');

SET @oldVal = 'Form - Test 12';
SET @newVal = 'Form - Test 1';

SELECT * FROM entity where INSTR(entity_name, @oldVal) !=0;
UPDATE entity SET entity_name = REPLACE (entity_name, @oldVal, @newVal) 
WHERE INSTR(entity_name, @oldVal) !=0 AND id > 0;
SELECT * FROM entity where INSTR(entity_name, @newVal) !=0;

SELECT * FROM entity_test where INSTR(entity_test_name, @oldVal) !=0;
UPDATE entity_test SET entity_test_name = REPLACE (entity_test_name, @oldVal, @newVal) 
WHERE INSTR(entity_test_name, @oldVal) !=0 AND id > 0;
SELECT * FROM entity_test where INSTR(entity_test_name, @newVal) !=0;

SELECT * FROM test_suite where INSTR(test_suite_name, @oldVal) !=0;
UPDATE test_suite SET test_suite_name = REPLACE (test_suite_name, @oldVal, @newVal) 
WHERE INSTR(test_suite_name, @oldVal) !=0 AND id > 0;
SELECT * FROM test_suite where INSTR(test_suite_name, @newVal) !=0;

SELECT * FROM version where INSTR(entity_name, @oldVal) !=0;
UPDATE version SET entity_name = REPLACE (entity_name, @oldVal, @newVal) 
WHERE INSTR(entity_name, @oldVal) !=0 AND id > 0;
SELECT * FROM version where INSTR(entity_name, @newVal) !=0;