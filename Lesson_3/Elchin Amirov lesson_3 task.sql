--1.EMPLOYEES cədvəlində əməkdaşların employee_id, first_name, last_name, email və salary məlumatlarını ekrana çıxarın. 
--  first_name, last_name sütunlarının dəyərləri böyük hərflərlə email sütunun dəyərləri isə ilk simvol böyük qalan 
--  simvollar isə balaca hərflərlə əks olunsun. 

select 
employee_id,
upper(first_name), 
upper(last_name), 
initcap (email), 
salary 
from employees;

--2.COUNTRIES cədvəlinin bütün sütunlarının məlumatlarını ekrana çıxarın. country_id sütunun dəyərləri balaca hərflərlə əks 
--  olunsun. 

select 
lower(country_id) as country_id,
country_name,
region_id
from countries ;

--3.EMPLOYEES cədvəlində əməkdaşların employee_id, first_name, last_name, email və salary məlumatlarını ekrana çıxarın. 
--  first_name və last_name sütunlarının dəyərləri aralarında bir boşluq(probel) ilə birləşdirilərək əks olunsun.

    select employee_id, 
    concat(first_name||' ', last_name) as full_name,
    email,
    salary 
    from employees;


--4.EMPLOYEES cədvəlində first_name, last_name, email, salary və phone_number sütunlarının birlikdə simvollarının sayı 
--  40 -dan böyük olan əməkdaşların məlumatlarını ekrana çıxarın.     
    
    select e.*,
    length(first_name||last_name||email||salary||phone_number) as length
    from employees e
    where length(first_name||last_name||email||salary||phone_number)>40;
                 
--5.EMPLOYEES cədvəlində job_id sütununun dəyərlərinin içərisində ilk üç simvolu nəzərə almadan digər qalan hissəsi 
--  'PROG' və 'MAN' dəyərlərinə malik olan məlumatları ekrana çıxaran sorğu yazın. 
    
    select * from employees
    where substr(job_id,4) in ('PROG','MAN');

-- 6. EMPLOYEES cədvəlində first_name və last_name sütunlarının uzunluqları eyni olan məlumatları   ekrana çıxardın. 
    
    select *
    from employees
    where length(first_name)=length(last_name);
    
-- 7. EMPLOYEES cədvəlində commission_pct sütunun dəyərləri NULL deyilsə 'Dəyər NULL deyil' yox   əgər dəyər NULL -sa 
--     'Dəyər NULL -dur' ekrana çıxartsın

    select e.*, 
    case when commission_pct is not null then 'Dəyər NULL deyil'
            else 'Dəyər NULL -dur'
            end as Category
    from employees e;

-- 8. EMPLOYEES cədvəlində job_id sütununda olan dəyərlərdən IT_PROG dəyəri olduqda ekrana Programmer, AD_PRES olduqda 
--     ekrana President, SA_MAN olduqda ekrana Sales Manager yerdə qalan dəyərlər üçün isə Digər məlumatlarını ekrana 
--     çıxardan sorğunu yazın. 
    
    select  e.*,
    case when job_id='IT_PROG' then 'Programmer'
         when job_id='AD_PRES' then 'President'
         when job_id='SA_MAN' then 'Sales Manager'
         else 'Digər'
    end as Job_title
    from employees e;

-- 9. Adında "s" hərfi (“s” hərfinin böyük və kiçik hərf olsada yoxlamada iştirak etsin), soyadının ikinci simvolu isə 
--     balaca "t" hərfi olan əməkdaşların adadını, soyadını, əmək haqqı   və işə qəbul tarixi haqqında məlumatları ekrana 
--     çıxardan sorğunu yazın (like -dan istifadə etmədən).  
    NO

-- 10. Ad və soyadın ümumi uzunluğu 15 simvoldan çox olan əməkdaşların adını, soyadını və bundan başqa formal adını ekrana
--     çıxarmaq lazımdır. Formal ad adın ilk simvolu və bir boşluq sonra soyadın ilk 14 simvolunun birləşdirilməsindən 
--     yaradılır.

    select first_name,last_name,
    concat(substr(first_name,1,1)||' ',substr(last_name,1,14)) as Formal_name,
    length(first_name||last_name) as length
    from employees
    where length(first_name||last_name)>15;

-- 11. first_name sütununda iki və ya daha çox sayda "a"(“a” hərfinin böyük və kiçik hərf olsada yoxlamada iştirak etsin) 
--     olan əməkdaşların məlumatlarını göstərin. 
    NO