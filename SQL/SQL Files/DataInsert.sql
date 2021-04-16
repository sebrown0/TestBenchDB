INSERT INTO `dakartest`.`employee_type`
	(`id`,`type_name`)
VALUES
	("QA1","Quality Assurance"),
    ("DEV1","Developer");
    
INSERT INTO `dakartest`.`employee`
	(`id`,`first_name`,`last_name`,`employee_type_id`)
VALUES
	("SB1","Steve","Brown","QA1");
    
INSERT INTO `dakartest`.`email`
	(`address_1`,`address_2`,`employee_id`)
VALUES
	("sbrown@dakarsoftware.com","","SB1");
    
INSERT INTO `dakartest`.`application`
	(`name`,`description`)
VALUES
	("iPortal","The new DakarHR iPortal.");
    
INSERT INTO `dakartest`.`version`
	(`major`,`minor`,`build`,`notes`,`application_id`)
VALUES
	(1,0,1,"First build of DakarHR iPortal.", 1),
    (1,0,2,"Second build of DakarHR iPortal.", 1);
    
INSERT INTO `dakartest`.`module`
	(`name`,`version_id`,`version_application_id`)
VALUES
	("navigation",1,1),
    ("navigation",2,1);
    
INSERT INTO `dakartest`.`test_suite`
	(`name`,`module_id`,`module_name`)
VALUES
	("left side",1,"navigation");
    
INSERT INTO `dakartest`.`test_case`
	(`name`,`priority`,`test_suite_id`,`description`)
VALUES
	("tc_1","5",1,"test case 1"),
    ("tc_2","3",1,"test case 2");
    
INSERT INTO `dakartest`.`test_run`
	(`tested_by_employee_id`,`version_application_id`,`version_id`,`description`,`notes`)
VALUES
	("SB1",1,1,"Test run 1 for iPortal","No notes");
    
INSERT INTO `dakartest`.`test_suite_result`
	(`number_test_cases_run`,`number_failures`,`number_passed`,`number_ignored`,`test_suite_id`,`test_run_id`)
VALUES
	(2,0,2,0,1,1);    

INSERT INTO `dakartest`.`test_case_result`
	(`test_passed`,`test_ignored`,`comments`,`test_case_id`,`test_suite_result_id`,`test_suite_result_test_suite_id`)
VALUES
	(TRUE,FALSE,"Test completed.",1,1,1);    