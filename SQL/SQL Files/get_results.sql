SELECT 
	a.name as "application",
	m.name as "module_name",
    v.major, v.minor,v.build,
    /*concat(v.major, "_", v.minor, "_", v.build ) as "version",*/
    tr.tested_on,
    concat(e.first_name," ",e.last_name) as Test_run_by,
    tsr.*,
    ts.name AS "test_suite_name", ts.module_name
FROM 	
	module m 
INNER JOIN
	version v 
ON 
	m.version_id = v.id
INNER JOIN
	application a
ON
	a.id = v.application_id
INNER JOIN
	test_run tr
ON
	tr.version_id = v.id
INNER JOIN
	test_suite_result tsr
ON
	tsr.test_run_id = tr.id
INNER JOIN
	employee e
ON
	e.id = tr.tested_by_employee_id
INNER JOIN
	test_suite ts
ON
	ts.id = tsr.test_suite_id
WHERE
	v.major = 1 AND v.minor = 0 AND v.build = 1;