CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test_run_result`(
	IN testRunId INT UNSIGNED,
    IN runByEmpId VARCHAR(45),
    IN numTestCasesRun INT UNSIGNED,
    IN numTestCasesFailed INT UNSIGNED,
    IN numTestCasesPassed INT UNSIGNED,
    IN numQualifiedPasses INT UNSIGNED,
    IN numTestCasesIgnored INT UNSIGNED,
    IN cmnts TEXT)
BEGIN
	INSERT INTO `test_bench`.`test_run_result`(
		`test_run_id`, `test_run_run_by_employee_id`, `result_timestamp`, `number_test_cases_run`, `number_failures`, 
        `number_passed`, `number_qualified_passes`, `number_ignored`, `comments`) 
	VALUES (
		testRunId, runByEmpId, now(), numTestCasesRun, numTestCasesFailed, numTestCasesPassed, numQualifiedPasses, numTestCasesIgnored, cmnts);
END