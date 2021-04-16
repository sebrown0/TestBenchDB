select * from employee_type;
select * from employee;
select * from email;
select * from application;
select * from version;
select * from module;
select * from test_suite;
select * from test_case;
select * from test_run;
select * from test_suite_result;
select * from test_case_result;

select 
	a.name as "application",
	m.name as "module_name"
from 
	module m 
inner join 
	version v 
on 
	m.version_id = v.id
inner join
	application a
on 
	a.id = v.application_id
where
	v.major = 1 and v.build = 1;
