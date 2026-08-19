


select * from employees
where hire_date like '%2007' ;


select first_name||' '||last_name as full_name,
department_id
from employees 
where job_id like 'SA%';


select * from employees
where hire_date between '01-01-07' and '31-01-07';

