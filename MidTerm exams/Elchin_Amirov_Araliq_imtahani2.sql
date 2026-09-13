*********************************************HƏR BİRİNİZƏ UĞURLAR******************************

--1.Job_history cedvelinde ishcilerin ishe qebul ve ishden cixma tarixleri var. Ishcilerin ishden cixma iline gore sayini hesablayan sorgu yazin. 
--(Her bir ilde nece ishci ishden cixib). Onlarin pesheleri de eks olunmalidir neticede. Netice ishci sayina gore azalan sirada duzulmelidir. 
--Sorğuda il, JOB_ID, hemin ilde hemin job_id-de nece ishci ishi terk etdiyi gosterilmelidir.

select extract(year from end_date) as il, 
job_id, 
count(employee_id) as cixan_ishci_sayi from job_history
group by extract(year from end_date),job_id
order by count(employee_id) desc;

--2. Ortalama əməkhaqqısı yüksək olan Top5 şəhərin adı və ortalama maaşını göstərən sorğu yazın.
    
    select 
    l.city,
    avg(e.salary)
    from employees e
    inner join departments d
    on
    d.department_id=e.department_id
    inner join locations l
    on
    l.location_id=d.location_id
    group by l.city
    order by avg(salary)desc
    fetch first 5 rows only;
    
--3. Meneceri ilə eyni ay və ildə işə başlayan əməkdaşları tapan sorğu yazın.
    
    select 
    e.employee_id
    from employees e
    inner join employees m
    on e.employee_id=m.employee_id
    where TO_CHAR(e.hire_date, 'MM-YYYY') =
      TO_CHAR(m.hire_date, 'MM-YYYY');
    
    
--4) Əməkdaşların əmək haqqlarına 20% əlavə edildikdə , bu dəyər həmin departamentin orta əmək haqqısına (tam hissəyə görə yuvarlaqlaşdırılmış) 
--bərabər olan əməkdaşların siyahısını tapın.

    select e.*, salary*1.2 from employees e
    where salary*1.2 in (select round(avg(salary),0) from employees group by department_id);
    
    
--5) Hər bir əməkdaşın maaşını göstərin və əgər maaşı öz job növündəki minimum maaşa bərabərdirsə “MIN JOB SAL”, 
--maksimuma bərabərdirsə “MAX JOB SAL”, digərlərinə “NORMAL” yazın

   select e.employee_id,
       e.salary,
       case
         when e.salary = (select min(salary)
                          from employees
                          where job_id = e.job_id) then 'MIN JOB SAL'
         when e.salary = (select max(salary)
                          from employees
                          where job_id = e.job_id) then 'MAX JOB SAL'
         else 'NORMAL'
       end as category
from employees e;



