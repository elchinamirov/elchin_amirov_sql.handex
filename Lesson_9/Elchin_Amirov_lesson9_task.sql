/* 1.Maashi her hansi bir department uzre minimal maasha beraber olan ishcilerin name ( first name and last name ),
 salary, department id cixaran sorgu yazin. */
    
    select 
    department_id,
    first_name,
    last_name,
    min(salary) 
    from employees
    group by 
    
    first_name,
    last_name,
    department_id;
    
    
    select department_id,
    first_name,
    last_name,
    salary
    from employees
    where salary IN (select min(salary) from employees group by department_id);

--2.Clara ishlediyi departamentde ishleyen ishcilerin ad soyad hire date gosteren sorgu yazin, 
--lakin Claranin ozu son neticede olmasin.
  select department_id from employees
  where first_name='Clara';  
    
    select department_id,
    first_name, last_name, hire_date 
    from employees
    where department_id = (select department_id from employees
    where first_name='Clara') and first_name<>'Clara';

--3.Department adi, ortalama maash(salary), ve komissiya ile ishleyen ishcilerin sayini gosteren sorgu yazin(employees, departments)

    select d.department_name,
    avg(salary),
    count(commission_pct)
    from employees e
    full outer join departments d
    on d.department_id=e.department_id
    where commission_pct is not null and department_name is not null
    group by d.department_name;
    
    
--4.Ishcinin job_title, full_name (first and last name) ve maximum maashi ile salary-si arasinda ferqi tapan sorgu yazin(employees, jobs cedvelleri)
    
    select
    e.first_name||' '||e.last_name as full_name,
    e.job_id,
    e.salary,
    
    (select job_title from jobs j
    where j.job_id=e.job_id) as job_title,
    
    (select max_salary from jobs j
    where e.job_id=j.job_id)-e.salary as difference
    
    from employees e;
   ----------------------------------------------------- 
select 
job_title, 
first_name||' '||last_name as full_name, 
max_salary-salary as difference 
from employees e 
inner join jobs j 
on j.job_id=e.job_id;
    
--5.ID-si 163 olan ishciden daha cox maash alan ishcilerin siyahisini(first name ve last name) gosteren sorgu yazin.
    select first_name,
    last_name,
    salary,
    (select salary from employees
    where employee_id=163) as salary_163
    from employees
    where salary>
    (select salary from employees
    where employee_id=163);
    
--6.ID-si 169 olan ishci ile eyni ishi goren ishcilerin siyahisini cixaran sorgu yazin.
    
    
    select * from employees
    where job_id=(select job_id from employees e
    where employee_id=169);
    
--7.Manager id-si 120 ve 150 arasinda olan ishcilerin ishlediyi departamentde ishlemeyen ishcilerin siyahisini gosteren sorgu yazin
    select * from employees
    where department_id not in(select department_id from employees
    where manager_id 
    between 120 and 150);
    
   
    
--8. Sistem tarixini, EMPLOYEES və DEPARTMENTS cədvəllərindəki məlumatların sayını ekrana çıxardan sorğunu yazın.
    
    select sysdate,
    (select count(*) from employees)as employees,
    (select count(*)from departments) as departments
    from dual;
    
--9. Departamentlər üzrə minimal əmək haqqısı 10 nömrəli departamentdəki maksimal əmək haqqından çox olan departamentlərin adını, 
--departament nömrəsini   və minimal əmək haqqını ekrana çıxaran sorğunu yazın.                                   
    
    select e.department_id,
    d.department_name,
    min(salary) from employees e
    inner join departments d
    on e.department_id=d.department_id
    
    group by e.department_id,
    d.department_name
    having min(e.salary)>(select max(e.salary) from employees e
    where e.department_id=10);
    
    (select max(salary) from employees
    where department_id=10);
    
--10. 10 nömrəli departamentdəki əmək haqqına bərabər əmək haqqı alan əməkdaşların adını, soyadını, işə qəbul tarixini, 
--departament nömrəsini, departamentin adını, şəhəri, ölkə kodunu və ölkənin adını ekrana çıxaran sorğunu yazın.
    
    select 
    first_name,
    last_name,
    hire_date,
    d.department_id,
    department_name,
    l.city,
    l.country_id,
    c.country_name

    from employees e
    inner join departments d
    on d.department_id=e.department_id
    inner join locations l
    on l.location_id=d.location_id
    inner join countries c
    on c.country_id=l.country_id
    
    where salary in (select salary from employees e
    where e.department_id =10);
   
--11. 121 və 200 nömrəli əməkdaşla eyni departamentdə və eyni menecerə tabe olan əməkdaşların siyahını əks etdirən sorğunu yazın.
        
        select e.*,
            m.first_name||' '||m.last_name as manager_name,
            m.employee_id
        from employees e
        join employees m
        on e.manager_id=m.employee_id
            where e.department_id in (select e.department_id from employees e
            where e.employee_id in (121,200)) and e.manager_id in (select e.manager_id from employees e
            where e.employee_id in (121,200))
            and e.employee_id not in(121,200);
        
        
        
        
--12. Vəzifəsi SA_REP olan əməkdaşlar içərisində ən yüksək əmək haqqı alan əməkdaşı tapın.

    select max(salary) from employees
    where job_id in (select job_id from employees where job_id ='SA_REP');

    select *
    from employees
    where job_id='SA_REP'
    and salary =(select max(salary) from employees where job_id='SA_REP')
    ;
        
--13. 80 nömrəli departamentdə əmək haqqısı vəzifəsi SA_REP olan əmədaşlar arasında maksimum əmək haqqına bərabər olan sorğunu yazın. 
--Sorğunun nəticəsini ada görə sıralayın.
    select * from employees
    where salary=(
    select max(salary) from employees where job_id='SA_REP' AND department_id=80)
    order by first_name ;
    
--14. Adı böyük T hərfi ilə başlayan şəhərlərdə (locations cədvəli) işləyən işçilərin employee_id, last_name və job_id haqqında məlumatları göstərin.
    
    select l.city,
    e.employee_id, 
    e.last_name,
    e.job_id
    from locations l
    inner join departments d
    on l.location_id=d.location_id
    inner join employees e
    on d.department_id=e.department_id
    where l.city like 'T%';
    
    select l.city from locations l where l.city like 'T%';
    
-- 15. Öz departamentlərində orta əmək haqqından aşağı əmək haqqı alan əməkdaşların siyahısını ekrana çıxardın.
    
    select department_id,
    avg(salary)
    from employees
    group by department_id
    having salary<(select avg(salary) from employees
    group by department_id);
    
    select department_id from employees e1
    inner join employees e2
    on e1.department_id=e2
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- 16. Aşağıdakı alt sorğunun qaytardığı nəticəni join vasitəsilə əldə edən sorğu yazın. 
     ;select emp.employee_id, 
            emp.first_name, 
            emp.last_name
       from employees emp
      where not exists (select 1
                          from job_history his
                         where emp.employee_id = his.employee_id);
                         
                         
    select e.employee_id,
    e.first_name,
    e.last_name
    from employees e
    left join job_history jh
    on e.employee_id=jh.employee_id
    where jh.employee_id is null
    ;
    
-- 17.Əmək haqqısı hər il üzrə ilk üç ayda işə qəbul olunan əməkdaşların orta əmək haqqısına(yuvarlaqlaşdırma tam hissəyə qədər) bərabər olan əməkdaşların məlumatlarını 
--    ekrana çıxardan sorğunu yazın. Ekrana müştərinin adı, soyadı, işlədiyi vəzifəsi, işlədiyi vəzifənin adı(jobs), departamentin nömrəsi
--    departamentin adı, əmək haqqı və əmək haqqı üzrə dərəcəni(job_grade) çıxardın.
    CREATE TABLE job_grades (
grade 		CHAR(1),
lowest_sal 	NUMBER(8,2) NOT NULL,
highest_sal	NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;
    
    
    with avg_sal as
(
    select extract(year from hire_date) as hire_year,
           round(avg(salary)) as avg_salary
    from employees
    where extract(month from hire_date) between 1 and 3
    group by extract(year from hire_date)
)
select e.first_name,
       e.last_name,
       e.job_id,
       j.job_title,
       d.department_id,
       d.department_name,
       e.salary,
       jg.grade
from employees e
inner join avg_sal a
on extract(year from e.hire_date) = a.hire_year
and e.salary = a.avg_salary
inner join jobs j
on e.job_id = j.job_id
inner join departments d
on e.department_id = d.department_id
left join job_grades jg
on e.salary between jg.lowest_sal and jg.highest_sal;
    
--18)Əmək haqqısı hər il üzrə ilk üç ayda işə qəbul olunan əməkdaşların ümumi əmək haqqısına və həmin il işə qəbul olan işçilərin sayının hasilinə bərabər olan əməkdaşların 
--   məlumatlarını ekrana çıxardan sorğunu yazın. Ekrana müştərinin adı, soyadı, işlədiyi vəzifəsi, işlədiyi vəzifənin adı(jobs), 
--   departamentin nömrəsi departamentin adı, əmək haqqı və əmək haqqı üzrə dərəcəni(job_grade) çıxardın.
    
    with year_data as
(
    select extract(year from hire_date) as hire_year,
           sum(case
                 when extract(month from hire_date) between 1 and 3
                 then salary
               end) as total_salary,
           count(*) as emp_count
    from employees
    group by extract(year from hire_date)
)
select e.first_name,
       e.last_name,
       e.job_id,
       j.job_title,
       d.department_id,
       d.department_name,
       e.salary,
       jg.grade
from employees e
inner join year_data y
on extract(year from e.hire_date) = y.hire_year
and e.salary = y.total_salary * y.emp_count
inner join jobs j
on e.job_id = j.job_id
inner join departments d
on e.department_id = d.department_id
left join job_grades jg
on e.salary between jg.lowest_sal and jg.highest_sal;
    
--20)Əmək haqqısı hər il üzrə ilk və son üç ayı üzrə işə qəbul olunan əməkdaşların orta əmək haqqısına(yuvarlaqlaşdırma tam hissəyə qədər) bərabər olan müştərilərin 
--   məlumatlarını ekrana çıxardan sorğunu yazın. Ekrana müştərinin adı, soyadı, işlədiyi vəzifəsi, işlədiyi vəzifənin adı(jobs), 
--   departamentin nömrəsi departamentin adı, əmək haqqı və əmək haqqı üzrə dərəcəni(job_grade) çıxardın.
    
    with avg_sal as
(
    select extract(year from hire_date) as hire_year,
           round(avg(salary)) as avg_salary
    from employees
    where extract(month from hire_date) between 1 and 3
       or extract(month from hire_date) between 10 and 12
    group by extract(year from hire_date)
)
select e.first_name,
       e.last_name,
       e.job_id,
       j.job_title,
       d.department_id,
       d.department_name,
       e.salary,
       jg.grade
from employees e
inner join avg_sal a
on extract(year from e.hire_date) = a.hire_year
and e.salary = a.avg_salary
inner join jobs j
on e.job_id = j.job_id
inner join departments d
on e.department_id = d.department_id
left join job_grades jg
on e.salary between jg.lowest_sal and jg.highest_sal;
    
-- Aşağıdakı tapşırıqlarda with və çoxluq operatorlarından istifadə etməklə sorğular yazılmalıdır(Sinifdə etdiyimizə uyğun).
--21) Subquery -dən istifadə edərək join -lər dərsində yazdığımız sorğuları SQLDeveloperdə icra edən zaman nəticəsinin əks olunması üçün sorğuları yazın(with istifade etmekle).  
--        21.1 Aşağıdakı cədvəllərdən qeyd olunan məlumatları ekrana çıxartmaq tələb olunur. Müştəri nömrəsini, ad, soyad, ata adı, şəxsiyyət vəsiqəsinin seriyası, şəxsiyyət vəsiqəsinin 
--         nömrəsi,  telefon nömrəsi(telefon nömrəsinin qarşısındakı ölkə kodunu yığışdıraraq ancaq nömrəni ekrana çıxardın), etdiyi tranzaksiyanın məbləği, etdiyi tranzaksiyanın tarixi 
--         və iban  haqqında məlumatlar ekrana çıxmalıdır. Ancaq aktiv müştərilərin məlumatları əks olunmalıdır. Bundan başqa müştərilərin bütün məlumatları ekranda əks olunmalıdır. 
--         Yəni hər hansı tranzaksiya edib  etməməsindən asılı olaraq.  

  /*/*    CUST_INFORMATION
      _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
     |       |       |             |           |               |           |         |
     |CUST_NO|	NAME |  SURNAME    | PATRONYMIC| DCM_SERIAL_NO | DCM_NO	   | STATUS  |
     |_ _ _ _|_ _ _ _|_ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _|
     | 11016 | Azər  | Məmmədov	   |  Ehtiram  |     AZE       | 123654	   |    A    |
     |_ _ _ _|_ _ _ _|_ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _|  
     | 11017 | Asəf  | Ələkbərov   |  Bilal    |     AZE       | 65287	   |    A    |
     |_ _ _ _|_ _ _ _|_ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _|
     | 11018 | Vüsal | Hadıyev	   |  Sadıq    |     AZE       | 917863781 |	A    | 
     |_ _ _ _|_ _ _ _|_ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _|
     | 11019 | Mədinə| Məmədyarova |  Salam    |     AZE       | 863179	   |    P    |
     |_ _ _ _|_ _ _ _|_ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _ _ _ _|_ _ _ _ _ _|_ _ _ _ _|

     cust_no – hər müştəri üçün unikal dəyərləri saxlayır
     name – müştərinin adı
     surname -müştərinin soyadı
     patronymic -müştərinin ata adı
     dcm_serial_no -şəxsiyyət vəsiqəsinin seriyası
     dcm_no -şəxsiyyət vəsiqəsinin nömrəsi
     status -müştərinin aktiv olub -olmamasını bildirir(A -aktiv, P -passiv)

    PHONE_NUMBER
    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  
   |                 |               |
   |dcm_serial_no_id |	phone_number |
   |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _| 
   |  AZE123654	     | +994555874766 |
   |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _| 
   |  AZE5287	     | +994504194066 |
   |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _|  
   |  AZE917863781   | +994705874766 |
   |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _|
   |  AZE11019	     | +994504561232 |
   |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _| 

   dcm_serial_no - şəxsiyyət vəsiqəsinin seriyası və nömrəsi haqqında məlumatları birləşdirilmiş şəkildə saxlayır.
   phone_number - müştərinin telefon nömrəsi haqqında məlumatları saxlayır.

   TRANSACTION
   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  
  |                 |         |                     | 
  |     iban	    | amount  |	transaction_date    |
  |_ _ _ _ _ _ _ _ _|_ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _| 
  | AZN944110162245 |	150   |	15.02.2022 14:05:22 |
  |_ _ _ _ _ _ _ _ _|_ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _| 
  | USD844110179865 |	235   |	17.08.2022 10:05:22 | 
  |_ _ _ _ _ _ _ _ _|_ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _|  
  | GPB928110183792 |	278   |	20.09.2022 12:05:22 |
  |_ _ _ _ _ _ _ _ _|_ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _| 

  iban -müştərinin hesabı(yeddinci simvol daxil olmaqla sonrakı 5 simvol customer_no dur)
  amount -etdiyi tranzaksiyanın məbləği
  transaction_date -etdiyi tranzaksiyanın tarixi/*/*
  
  
  with cust as
(
    select cust_no,
           name,
           surname,
           patronymic,
           dcm_serial_no,
           dcm_no,
           dcm_serial_no || dcm_no as dcm_serial
    from cust_information
    where status = 'A'
),
phone as
(
    select dcm_serial_no_id,
           substr(phone_number, 5) as phone_number
    from phone_number
),
trans as
(
    select substr(iban, 7, 5) as cust_no,
           amount,
           transaction_date,
           iban
    from transaction
)
select c.cust_no,
       c.name,
       c.surname,
       c.patronymic,
       c.dcm_serial_no,
       c.dcm_no,
       p.phone_number,
       t.amount,
       t.transaction_date,
       t.iban
from cust c
left join phone p
on c.dcm_serial = p.dcm_serial_no_id
left join trans t
on c.cust_no = t.cust_no;
  
/*

