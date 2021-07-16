CALL get_basic_test_details_for_entity(30);
SELECT INSTR("W3Schools.com", "COM") AS MatchPosition;
CALL new_procedure("Main Menu - Payroll - Employees - Schedule - Button - Redirect - ElementTestSuite - Form - Schedule");
CALL new_procedure("Main Menu - Payroll - Employees - Schedule");
CALL new_procedure("Main Menu - Payroll");

SELECT * FROM entity WHERE LOCATE(entity_name, "Button") != 0;
SELECT * FROM entity WHERE INSTR(entity_name, "Button - Redirect") != 0;

SELECT * FROM entity WHERE parent_id = 331 AND parent_entity_id = 329;
CALL get_entities_that_match_name('Main Menu - Payroll - Employees - Schedule - Button - Redirect - ElementTestSuite - Form - Schedule');
CALL get_entities_that_match_name('Main Menu - Payroll - Employees - Schedule - Button - Redirect - ElementTestSuite - Form');
CALL get_entities_that_match_name('Main Menu - Payroll');