select e.*, to_char(hire_date,'fmday')
from employees e
where (to_char(hire_date,'fmday'))='bazar ertəsi'
;

select count(*),
count(100),
count(null),
count('Handex'),
count(1000)
from employees;

select to_char(hire_date,'fmmon'),count(hire_date) from employees
group by to_char(hire_date,'fmmon');

select * from employees;


select department_id,to_char(hire_date,'fmmon'),
count(hire_date),
sum(salary) 
from employees

where extract(month from hire_date) in (1,2,3)
group by to_char(hire_date,'fmmon'),department_id;



