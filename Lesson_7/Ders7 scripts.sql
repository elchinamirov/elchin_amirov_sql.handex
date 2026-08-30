select * from employees;
  select * from departments;
  
  select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         d.department_id,
         d.department_name,
         d.location_id
   from employees e
   inner join departments d
   on e.department_id=d.department_id
   
    select *
   from employees e
   inner join departments d
   on e.department_id=d.department_id
   
   cust
   cust_id    cust_name   cust_surname
   100        Eldost       ELiyev
   101        Emrah        Abasov
   102        Ferid        Memmedov
   
   orders
   
   order_id    order_date      order_amount   cust_id
   1000        '01.01.2025'    100            100
   1001        '01.01.2025'    250            101
   1002        '01.01.2025'    300            100
   1003        '01.01.2025'    150            105
   --left
      select  c.cust_name,
             c.cust_surname,
             o.order_date,
             o.order_amount 
   from cust c left join orders o
   on c.cust_id=o.cust_id
   cust_name   cust_surname  order_date   order_amount
   Eldost       ELiyev       '01.01.2025'    100
   Eldost       ELiyev       '01.01.2025'    300
   Emrah        Abasov       '01.01.2025'    250
   Ferid        Memmedov     null            null
   
   
   select  c.cust_name,
             c.cust_surname,
             o.order_date,
             o.order_amount 
   from cust c right join orders o
   on c.cust_id=o.cust_id
   
   cust_name   cust_surname  order_date   order_amount
   Eldost       ELiyev       '01.01.2025'    100
   Eldost       ELiyev       '01.01.2025'    300
   Emrah        Abasov       '01.01.2025'    250
   null         null         '01.01.2025'    150
   
   
      
   select  c.cust_name,
             c.cust_surname,
             o.order_date,
             o.order_amount 
   from cust c full join orders o
   on c.cust_id=o.cust_id
   
   cust_name   cust_surname  order_date   order_amount
   Eldost       ELiyev       '01.01.2025'    100
   Eldost       ELiyev       '01.01.2025'    300
   Emrah        Abasov       '01.01.2025'    250
   Ferid        Memmedov     null            null
   null         null         '01.01.2025'    150
   
    select  c.cust_name,
           c.cust_surname,
           o.order_date,
           o.order_amount 
   from cust c
   inner join orders o
   on c.cust_id=o.cust_id
   cust_name   cust_surname  order_date   order_amount
   Eldost       ELiyev       '01.01.2025'    100  
   Eldost       ELiyev       '01.01.2025'    300
   Emrah        Abasov       '01.01.2025'    250
   
   
   
   
   
    select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         e.department_id,
         d.department_name,
         d.location_id
   from employees e left join departments d
   on e.department_id=d.department_id
   
   select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         d.department_id,
         d.department_name,
         d.location_id
   from departments d left join employees e
   on e.department_id=d.department_id
   
     
   select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         d.department_id,
         d.department_name,
         d.location_id
   from employees e right join  departments d
   on e.department_id=d.department_id
   
    
   
   
   
       select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         e.department_id,
         d.department_name,
         d.location_id
   from employees e full join departments d
   on e.department_id=d.department_id  


select * from employees;
select * from departments;
select * from locations;
select * from countries;



select
*
from employees e
inner join departments d
on e.department_id=d.department_id
inner join locations l
on d.location_id=l.location_id
inner join countries c
on l.country_id=c.country_id



---
select 27*107 from dual

select * from employees
cross join departments

cross join 
a                       b
id   name              yas     surname
1       a               25       aaa
2       b               35       bbb
3       c

1    a      25    aaa
1    a      35    bbb
2    b      25    aaa
2    b      35    bbb
3    c      25    aaa
3    c      35    bbb

--her bir olke uzre ortama maas

    select e.first_name,
         e.last_name,
         e.job_id,
         e.salary,
         e.department_id,
         d.department_name,
         d.location_id
   from employees e left join departments d
   on e.department_id=d.department_id
   
   
   select c.country_name,avg(salary),count(EMPLOYEE_ID)
   from employees e inner join departments d
   on e.department_id=d.department_id
   inner join locations l
   on l.LOCATION_ID=d.LOCATION_ID
   inner join countries c
   on c.COUNTRY_ID=l.COUNTRY_ID
   group by c.country_name
   having count(EMPLOYEE_ID)>50
   
   