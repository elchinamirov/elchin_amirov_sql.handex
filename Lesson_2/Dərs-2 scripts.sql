select salary,employee_id from employees;


select * from employees;

--operatorlar
--where

=,>,<,>=,<=
!=,<>,^=

in,like,between, is null
and or
order by fetch offset percent


select * 
 from employees
 where department_id=50
 
 
 select 
 --gormek istediyimiz sutunlar
 from table_name
 [where sert yazilir]
 
 select * from employees 
 where employee_id=105;


 select first_name,last_name,job_id from employees 
 where employee_id=105;
 
 select first_name ||' '|| last_name as full_name,
        job_id
  from employees
  where job_id='IT_PROG'
  
  select * from employees;
  
  
  select * from employees 
  where hire_date='17-jun-2003'
  
  select * from employees 
  where salary>=5000
 
 select * from employees
 where department_id!=50


 select * from employees
 where department_id<>50
 
  select * from employees
 where department_id^=50

 
 select * from employees
 where employee_id in (100,101,102,300)


select * from employees 
where job_id not in ('IT_PROG','FI_ACCOUNT')


select * from employees 
where hire_date in ('21-may-2007','07-feb-2007')

select * from employees 
where salary not between 5000 and 10000


select * from employees 
where hire_date between '07-jan-2007' and '01-jan-2008'

_, %

select * from employees
where phone_number not like '%123%'

select * from employees
where first_name like 'A___'


 select first_name ||' '|| last_name as full_name,
        job_id
  from employees
  where job_id='IT_PROg'
  
  
  --2007ci ilde ise qebul olan iscilerin siyahisi
  select * from employees 
  where hire_date between '01-jan-2007' and '31-dec-2007'
  --job_idsi SA ile baslayan iscilerin full_name ve vezifesi
  select first_name||'-'|| last_name as full_name,job_id from employees
  where job_id like 'SA%'
  
  
  
  null +5=null
  null*10=null
  
  
  select salary,commission_pct,
  salary-salary*nvl(commission_pct,0) as net_maas
  from employees
  
  select * from employees
  where commission_pct='null'----errorrr!!!
  
  select * from employees
   where commission_pct is null
   
  select * from employees
   where commission_pct is not null   
   --not
   
  select * from employees 
 where employee_id=105; 
   --and
   select * from employees
   where job_id='IT_PROG' and salary>5000
   sert1     sert2    netice
   False     True      False
   True      True      True
   True      False     False
   False     False     False
   
  select * from employees
   where job_id='IT_PROG' or salary>5000
   sert1     sert2    netice 
   False     True     True
   True      True      True
   True      False     True
   False     False     False
   
  --2008-den sonra ishe qebul olan ve dep_id 50 ve 100 olan isciler
  
  select * from employees
  where hire_date >='01-jan-2007' and department_id between 50 and 100;
  
     select * from employees
     where job_id='IT_PROG' or job_id='ST_MAN'
     
     select * from employees
  where  department_id between 50 and 100;  
     
      select * from employees
     where (job_id='IT_PROG' or job_id='ST_MAN') and salary>5000
     
     () not and or
      
      
      --nulls first
      
      select * from employees
      order by salary desc
      
      
        select * from employees
      order by department_id asc,salary asc
      
      
      select * from employees
      order by first_name desc
     
      select * from employees
      order by  commission_pct desc nulls last
      
       select * from employees
      order by  commission_pct asc nulls first
      
      
      
      select * from employees
      order by salary asc
      fetch next 10 rows only
      
      select * from employees
      where department_id=100
      order by salary desc
      
      
      
      select 
      gormek istediyimiz sutunlar
      from table
      [where]
      [order by]
      
     select * from employees
      order by salary desc 
      fetch next 2 rows only
      
          select * from employees
      order by salary desc 
      fetch next 11 rows with ties
      
      
       select * from employees
      order by salary desc 
      fetch next 10 percent rows only
      
      
      
      select * from employees
      order by salary desc 
      offset 5 rows 
      fetch next 10 rows only
      
      
         select * from employees
      order by salary desc 
      offset 10  rows 
      
      
      
      select * from employees
      where employee_id in (100,101,102,null);
      
      in or mentiqi ile isleyir
      
      
      select * from employees
      where employee_id=100 or employee_id=101 or employee_id=102 or employee_id=null
      
      
      
      select * from employees
      where employee_id not in (100,101,102,null);
      
      
      select * from employees
      where employee_id!=100 and employee_id!=101 and employee_id!=102 and employee_id!=null
      
      --2ci sual
      select * from employees
      where 1=1
      
       select * from employees
       where 1=1--hire_date>='01-jan-2007'
       and salary>5000
       
      
        select * from employees
      where employee_id=100