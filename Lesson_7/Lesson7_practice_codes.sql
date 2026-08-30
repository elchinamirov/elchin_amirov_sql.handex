select country_name,
avg(salary)
from employees e
inner join departments d
on e.department_id=d.department_id
inner join locations l
on l.location_id =d.location_id
inner join countries c
on c.country_id=l.country_id
group by country_name
;