Depolama alanı bitmek üzere … Depolama alanınız biterse dosya oluşturamaz, düzenleyemez ve yükleyemezsiniz. Ayda $0,89 ödeyerek 30 GB depolama alanına sahip olun.
1
%100
--ADD_MONTHS(date,n)




--NEXT_DAY(date,'char')

select next_day(sysdate,'sunday')  from dual

--last_day
select last_day(sysdate)  from dual

select  hire_Date,last_Day(hire_date) from employees


---Conversion Functions
--TO_CHAR funksiyası üçün

select sysdate,
        to_char(sysdate,'dd'),
        to_char(sysdate,'day'),
         to_char(sysdate,'dy'),
          to_char(sysdate,'ddd'),
          to_char(sysdate,'mm'),
          to_char(sysdate,'Month'),
          to_char(sysdate,'mon'),
          to_char(sysdate,'yyyy'),
          to_char(sysdate,'yy'),
          to_char(sysdate,'year'),
          to_char(sysdate,'mon-yy'),
          to_char(sysdate,'hh24:mi:ss'),
          to_char(sysdate,'q')
from dual



select hire_date,to_char(hire_date,'mm-yy')  from employees

select 
       to_char(sysdate,'fmday'),
       trim(to_char(sysdate,'day'))
      
  from dual

select sysdate,
       to_char(sysdate,'dd'),
       to_char(sysdate,'day'),
       to_char(sysdate,'dy'),
       to_char(sysdate,'ddd')
  from dual
select sysdate,
       to_char(sysdate,'mm'),
       to_char(sysdate,'Month'),
       to_char(sysdate,'mon'),
       to_char(sysdate,'yyyy'),
       to_char(sysdate,'yy'),
       to_char(sysdate,'year'),
       to_char(sysdate,'hh24')

  from dual

--gunler
select e.*,to_char(hire_date,'day') as gun  from employees e
where to_char(hire_date,'fmday')='monday'



select to_char(12345.67) from dual;
select to_char(12345.67, '99999.99') from dual;
select to_char(192345.679999, '099,999.99') from dual;
select to_char(-12345.67, '99,999.99') from dual;
select to_char(12345.67, '099,999.99') from dual;
select to_char(12345.67, '99,999.9900') from dual;
select to_char(12345.67, '$99,999.99') from dual;
select to_char(12345.67, 'C99,999.99') from dual;
select to_char(12345.67, '99999D99') from dual;
select to_char(0012345.6700, 'FM99999.99') from dual;
select to_char(12345.67, 'U99,999.99') from dual;







--translate
select 
replace('Salam','Say','Se'),
translate('Salam','Say','Se')
from dual

--EXTRACT
select sysdate,
      extract( day from sysdate),
      extract( month from sysdate),
      extract( year from sysdate)
  from dual


--reverse
select  reverse('Handex') from dual

--round(sysdate),trunc
select round(sysdate,'dd'),
       round(sysdate,'month'),
       round(sysdate,'year'),
       trunc(sysdate,'dd'),
       trunc(sysdate,'month'),
       trunc(sysdate,'year')
  from dual
  
  








--TO_NUMBER FUNKSIYASI
select '12,345.25'+5 from dual

select to_number('12345.67') from dual;
select to_number('12,345.67','99,999.99')+5 from dual;


---TO_DATE funksiyası

select '15-jun-2026'+10  from dual

select  to_date('15-jun-2026','dd-mon-yyyy')+5 from dual

select * from employees
where hire_date=to_Date('21.09.2005','dd.mm.yyyy')
 
select * from employees
where to_char(hire_date,'dd.mm.yyyy')='21.09.2005'

--NESTING Functions
F3(F2(F1(col,arg1),arg2),arg3)




select * from employees



select * from employees

---General Functions
--NVL(expr1,expr2)

select commission_pct,nvl(commission_pct,0) from employees
--NVL2(expr1,expr2,expr3)
select commission_pct,nvl2(commission_pct,0,1)  from employees


--NULLIF(expr1,expr2)
--COALESCE(expr1,expr2,...,exprn)
select coalesce(null,null,1,null,10,15,null)  from dual

select commission_pct,manager_id,salary,coalesce(commission_pct,0)  from employees


--------------------------------------------Group function


--rownum ve rowid
select rownum,e.*  from employees e
where rownum<10


 select * from employees
 fetch next 10 rows only

  
  select rowid,e.* from employees e
  ---sum,count, avg,min,max
  select sum(salary)  from employees
  
  select  sum(commission_pct) from employees
  
  select count(*),
         count(commission_pct)
  from employees
  
  
  --aggregate funksiyalar null deyerleri ignore edir!!!!
 
  --count(*)
  



  select count(*),
         count(100),
         count(null),
         count('Handex'),
         count(manager_id)
  from employees;
  
select null from employees
   


select round(avg(salary),2)  from employees   
 
 
select sum(salary)/count(commission_pct)  from employees

select max(salary)  from employees   
     
     select min(salary)  from employees   

 --having
 select department_id,
        avg(salary)
  from employees
  group by department_id

select  department_id,
        employee_id,
        max(salary),
        min(Salary)
from employees
group by department_id,
        job_id,
        employee_id



select
 case when salary<5000 then '1ci derece'
      when salary<10000 then '2ci derece'
      else '3cu derece'
end as bolgu,
  count(*)
  from employees
  group by (case when salary<5000 then '1ci derece'
      when salary<10000 then '2ci derece'
      else '3cu derece'
end)


--emp_id 100 150 arasi  ve ya job_id IT balayan iscilerin 

select department_id,
      avg(salary),
      max(salary),
      min(salary),
      sum(salary),
      count(*)
 from employees 
 where employee_id between 100 and 150 or substr(job_id,1,2)='IT'  
 group by department_id
 
 --distinct
 select job_id,
        avg(salary)
   from employees
   group by job_id
   having avg(salary)>5000
   
   
 select 
     count(distinct job_id)
 from employees
 
 1) her ay uzre nece nefer isci goturulub
 select to_char(hire_date,'month'),
         count(*)
   from employees
   group by to_char(hire_date,'month')
 2) 1,2,3-cü aylarda işə qəbul olmuş işçilərin hər bir departament üzrə ümumi maaşını 
göstərən sorğu yazın.
  
  
  select department_id,
        sum(salary)
   from employees
   where to_char(hire_date,'mm') in (1,2,3)
   group by department_id
  --listagg
  
   
3.Employees cedvelinden department_id-si 100 olanlarin siyahisini cixarin. 
First_name, last_name, ve name_length aliasi verilmish ifade gosterilmelidir.
Bu ifade eger first_name-in uzunlugu last_name-in uzunlugundan ferqlenirse , 
'Ferqli uzunluq' cavabi qaytarsin. eger uzunluqlar eyni olsa 'Eyni uzunluq' cavabi qaytarsin.



4) 1,2,3-cü aylarda işə qəbul olmuş işçilərin hər bir departament üzrə ümumi maaşını 
göstərən sorğu yazın.

   
   

2.Şirkətdə maaş artımları planlaşdırılır.
Əgər işçinin Job_id-sində CLERK sozu varsa maaşı  departament id-sinə uyğun artmalıdır. 
Məsələn 10 nömrəli dep-də işləyirsə 10 faiz, 50 nömrəlidə işləyirsə 50 faiz qədər artmalıdır və s.
Job_id-si SA ilə başlayan işçilərdən əgər təcrübəsi 2020-ci ilin dekabrın 31-i üçün 15 ildən 
çoxdursa(>=) maaşı 2 qat artmalıdır,  azdırsa olduğu kimi qalmalıdır maaş
Qalan bütün işçilərin maaşı 1000 AZN artacaq.
İşçinin ad,soyad, hire_date,job_id, department_id, salary və NEW_SALARY aliaslı sütunlar olmalıdır.
NEW_SALARY sütununda işçinin maaşının artımdan sonra nə qədər olacağı qeyd olunmalıdır.

