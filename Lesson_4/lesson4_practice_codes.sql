select e.*,
case when year(sysdate)-year(hire_date)<20 then '20 ile kimi'
     when year(sysdate)-year(hire_date) between 20 and 25 then '20-25'
     when year(sysdate)-year(hire_date) between 25 and 35 then '25-35'
     else '35+'
end as staj 
from employees e;

select e.*,
case when sysdate-hire_date<20*365 then '20 ile kimi'
     when sysdate-hire_date between 20*365 and 25*365 then '20-25'
     when sysdate-hire_date between 25*365 and 35*365 then '25-35'
     else '35+'
end as staj 
from employees e;

