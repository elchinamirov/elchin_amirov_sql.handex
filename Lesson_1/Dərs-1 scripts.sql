select *|column_name,alias,distinct from table_name;

SELECT * 
  from departments;
  
select * 
from employees;


select employee_id,
       salary,
       first_name,
       last_name,
       job_id
  from employees;
  
  
  select employee_id
   from employees;
   
   
   select employee_id,salary,first_name,last_name,job_id 
   from employees;
   
   
   select employee_id,
          first_name as ad,
          last_name,
          salary as Gelir,
          department_id
     from employees;
     
   select employee_id,
          first_name,
          last_name,
          salary
    from employees;

    select employee_id,
          first_name as ad2,
          last_name,
          salary as ayliq_gelir,
          department_id
     from employees;   
     
     
       select employee_id,
          first_name as select,
          last_name,
          salary as ayliq_gelir,
          department_id
     from employees;   
     _ # $
        select employee_id,
          first_name as ad_2,
          last_name,
          salary as ayliq_gelir,
          department_id
     from employees;   
     
     
        select employee_id,
          first_name as "Isci adi",
          last_name,
          salary as ayliq_gelir,
          department_id
     from employees;   
     
  
  select 1000 as branch_id,
        'Handex' as Branch_name,
        first_name,
        last_name,
        salary
         
    from hr.employees
 
 
 
 
coredwh.employee 
 
 select * from hr.employees
 ---hesablama,pipe
 
 select employee_id,
        first_name ||' '|| last_name as full_name
 from employees;
 
 select first_name,
        salary
        /*salary+500 as bonus,
        salary*12 as illik_maas
        salary*12*0.1 illik_bonus*/
 from employees;
 
 select * from employees;
 
 
 select distinct  department_id, job_id from employees;
 
 
 cust
 
id        cust_name
100       Orxan
101        Sevinc
102        Sevinc
100        Orxan
101        Hafiz

select  id,distinct cust_name from cust---olmazzz!!
 
 
 
 select
 --gormek istediyimiz sutunlar
 from
 table_name
 
 
 
 
select * from employees;
--İşçilərin aylıq maaşını və illik maaşını (SALARY * 12) göstər.
select salary, salary*12 from employees;

--İşçilərin maaşının 10%-ni hesabla və sütuna BONUS adı ver.
select salary,salary*0.1 as bonus from employees;
--EMPLOYEES cədvəlindən təkrarlanmayan DEPARTMENT_ID-ləri göstər.
select distinct department_id from employees;
--İşçilərin FIRST_NAME, LAST_NAME və SALARY + 1000 məlumatlarını göstər. Yeni sütunun adı NEW_SALARY olsun.
select first_name,last_name,salary+1000 as new_salary from employees;