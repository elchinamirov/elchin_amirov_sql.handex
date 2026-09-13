--currelated subquery
  
  
  select e.*,
      (select department_name  from departments d 
             where e.department_id=d.department_id) as dep_name
  from employees e
  
  select max(salary) from employees
  
  select * from employees
  where salary= (select max(salary) from employees)
  
  
    select * from employees
    order by salary desc
    fetch next 1 rows only
    
    
    select  rownum as rn,e.* from employees e
    where rownum<=10                           ---duzgun olmayan  versiya
    order by salary desc 
    
    select rownum,t.* from 
   ( select first_name as ad,
            last_name,
            salary
    from employees e   
    order by salary desc ) t
    where rownum<11
    
      select * from 
   ( select first_name as ad,
            last_name,
            salary
    from employees e   
    order by salary desc ) t
    where first_name='David'
  

    

  
  
  
  
  select * from departments;
  
  1700  serq
  1400  qerb
  1500  cenub
        simal
                 
                 
                 
                 

      
    2 defe vezife deyisikliyi eden iscilerin butun melumatlarini gosteren sorgu
    
   
    select * from employees e
    where 2=(select count(*) from job_history jh where e.employee_id=jh.employee_id)
    
    select count(*) from job_history jh where 102=jh.employee_id
    select * from employees e;
    select * from job_history e
 **Ikinci en yuksek maashi alan ishcinin ad soyad ve maashini cixaran sorgu yazin  
 
    
    
   
                      
                      
                      
--------------------------------ikinci hisse
    
--rownum
select rownum,e.* from employees e
where rownum<5


select * from employees
order by salary desc 
fetch next 10 rows only

select rownum,e.* from employees e
where rownum<=10
order by salary desc 

    
 select rownum,t.* from 
 (select * from employees
 order by salary desc) t
 where rownum<=10
      
   
   select department_id,
          to_char(hire_date,'Month') as ay,
          count(employee_id)
   from employees
   where to_char(hire_date,'fmMonth')='May'
   group by department_id,
          to_char(hire_date,'Month') 
   
   select * from 
     (select department_id,
          to_char(hire_date,'fmMonth') as ay,
          count(*) as say
   from employees
   group by department_id,
          to_char(hire_date,'fmMonth')) t
          where say=2
          
          
            select * from 
     (select department_id,
          to_char(hire_date,'fmMonth') as ay,
          count(*) as say
   from employees
   group by department_id,
          to_char(hire_date,'fmMonth')) t
          
          
          select department_id,
                round(avg(salary)) as avg_salary
        from employees 
        group by department_id
          
          
          select e.*, t.avg_salary
            from employees e
            inner join
             (select department_id,
                round(avg(salary)) as avg_salary
        from employees 
        group by department_id) t
        on e.department_id=t.department_id
        
        select e.*,
              (select avg(salary) from employees emp where e.department_id=emp.department_id) as dep_avg_salary,
              (select avg(salary) from employees emp where e.job_id=emp.job_id) as job_avg_salary
        from employees e
      
  --exists
  
  select * from employees
  where exists (select * from employees where employee_id=1000)
  
  select employee_id from job_history
  
  select * from employees
  where employee_id in ( select employee_id from job_history)
  
  select * from employees e
  where not exists (select 1 from job_history jh where e.employee_id=jh.employee_id)
  
  --CTE(with)
  
  select department_id,
        round(avg(salary)) as avg_salary
   from employees
   group by department_id
   
   
  
  with avg_salary as (  select department_id,
        round(avg(salary)) as avg_salary
   from employees
   group by department_id),
   avg_job_salary as (select department_id,
                             job_id,
        round(avg(salary)) as avg_salary
   from employees
   group by department_id,job_id)
  
  select * from avg_salary a
  inner join employees e
  on a.department_id=e.department_id
  inner join avg_job_salary aj
  on e.job_id=aj.job_id