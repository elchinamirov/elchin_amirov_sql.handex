select m.first_name,
count(e.employee_id) as say
from employees e
inner join employees m
on m.employee_id=e.manager_id
group by m.first_name
order by say desc;

