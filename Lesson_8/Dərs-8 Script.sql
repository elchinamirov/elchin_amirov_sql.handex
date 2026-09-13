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
   
   
   
   
   
  -- self
  
  select e.employee_id as isci_id,
         e.first_name as isci_name,
         e.last_name   as isci_surname,
         e.manager_id  as isci_man_id,
         m.employee_id as man_id,
         m.first_name  as man_name,
         m.last_name    as man_surname
  from employees e
  join employees m
  on e.manager_id=m.employee_id;
  
  
  --natural join
  
  
  select * from employees;
  select * from job_history;
  
  select *
   from employees e
   inner join job_history jh
   on e.employee_id=jh.employee_id
      and e.job_id=jh.job_id
      and e.department_id=jh.department_id
   
   
   select *
     from employees e
     natural join job_history jh
   
   
   --using
   
   select department_id from employees e
   join job_history jh
   using (employee_id,job_id,department_id)
   
   
   non-equal join
   
   select  * from job_grades;
   select * 
   from employees e
   join job_grades jb
   on e.salary between LOWEST_SAL and HIGHEST_SAL;
   
   
   
   select *
   from employees e,departments d
   where e.department_id=d.department_id(+)
   
   
    select *
   from employees e,departments d
   where e.department_id(+)=d.department_id
   
   
   
   
   --left join
   cus              pay

   select * from employees e
   left join departments d
   on e.department_id=d.department_id and salary>5000
   
     select * from employees e
   left join departments d
   on e.department_id=d.department_id
   where  salary>5000
   
her bir managerin iscilerinin sayini   
select m.first_name,
count(e.employee_id)
from employees e join employees m
on e.manager_id=m.employee_id
group by m.first_name;




--subquery


select * 
  from main_table 
  where column_name|expressin  operator (select * 
                                         from subquery
                                         [where])
   
--1
--=,>,<,>=,<=

--in,all, any

select salary from employees
where first_name='Susan'

select * from employees
where salary>6500

select * from employees
where salary>(select salary from employees where first_name='Susan')



select salary from employees where job_id='IT_PROG'

select * from employees
where salary in (select salary from employees where job_id='IT_PROG') and job_id!='IT_PROG'


select distinct employee_id from job_history

select * from employees
where employee_id not in (select distinct employee_id from job_history)



select max(salary) from employees


select * from employees
where salary=(select max(salary) from employees)


select max(salary)
from employees
group by department_id


select * from employees
where salary in (select max(salary)
from employees
group by department_id)


select * from employees

emp id 120 ve 150 

select manager_id,department_id from employees where employee_id in (120,150)

select * from employees
where manager_id in (select manager_id from employees where employee_id in (120,150))
and department_id in (select department_id from employees where employee_id in (120,150))


select * from employees
where (manager_id,department_id) in (select manager_id,department_id from employees where employee_id in (120,150))

--


--and employee_id not in (120,150)


select salary  from employees where job_id='IT_PROG'

all

select * from employees
where salary >= all(select salary  from employees where job_id='IT_PROG')
--ekv:  salary>9000 and salary>6000 and salary >4800 and salary>4200
any---

select * from employees
where salary >= any(select salary  from employees where job_id='IT_PROG')
--ekv:  salary>9000 or salary>6000 or salary >4800 or salary>4200