--1.EMPLOYEES cədvəlində first_name, last_name və email sütunlarının dəyərlərini birləşdirərək 
--bütün simvolları balaca hərfə çevirərək aşağıda qeyd olunan əməliyyatları yerinə yetirin. 
--  a) 'an' dəyərinin birinci, ikinci və üçüncü mövqeyinin qiymətini ekrana çıxarmaq (sorğuda üç sütun olacaq)
     select 
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',1,1) as birinci,
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',1,2) as ikinci,
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',1,3) as ucuncu
     from employees ;
--  b) 'an' dəyərinin sondan əvvələ olan birinci, ikinci və üçüncü mövqeyinin qiymətini ekrana çıxarmaq (sorğuda üç sütun 
--  olacaq)
     select 
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',-1,1) as sondan_birinci,
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',-1,2) as sondan_ikinci,
          instr(concat(concat(lower(first_name),lower(last_name)),lower(email)),'an',-1,3) as sondan_ucuncu
     from employees ;
    
--2.EMPLOYEES cədvəlində first_name, last_name və email sütunlarının dəyərlərini birləşdirərək bütün simvolları balaca 
--  hərfə çevirərək aşağıda qeyd olunan əməliyyatları yerinə yetirin.
--  a) 2 - ci simvoldan sonra 4 simvolu götürərək 'live' dəyərinə bərabər olan əməkdaşların   məlumatlarını ekrana çıxarmaq.
    
    select e.*
    from employees e
    where substr(concat(concat(lower(first_name),lower(last_name)),lower(email)),2,4)='live' ;
    
--  b) 6 - ci simvoldan sonra 7 simvolu götürərək 'partner' dəyərinə bərabər olan əməkdaşların məlumatlarını ekrana çıxarmaq.  

    select e.*
    from employees e
    where substr(concat(concat(lower(first_name),lower(last_name)),lower(email)),6,7)='partner' ;

--  c) Sondan 7 -ci simvoldan 5 simvolu götürərək 'green' dəyərinə bərabər olan əməkdaşların məlumatlarını ekrana çıxarmaq.    
   
    select e.*
    from employees e
    where substr(concat(concat(lower(first_name),lower(last_name)),lower(email)),-7,5)='green' ;

--3.EMPLOYEES cədvəlində commission_pct sütununun null olan dəyərləri 1.236548 ilə əvəz edərək salary sütununun dəyərləri
--   ilə toplayaraq aşağıdakı əməliyyatları yerinə yetirin. 
--    a) kəsr hissəsində 1 rəqəmə qədər yuvarlaqlaşdırın

    select e.*,
    round(NVL(commission_pct,1.236548)+salary,1) as a 
    from employees e;

--    b) tam hissəyə qədər yuvarlaqlaşdırın

    select e.*,
    round(NVL(commission_pct,1.236548)+salary,0) as b
    from employees e;

--    c) yuvarlaqlaşdırma etmədən ədədin tam hissəsini götürün
     
   select e.*,
    NVL(commission_pct,1.236548)+salary as case_c,
    trunc(NVL(commission_pct,1.236548)+salary) as result_c 
   from employees e;
     
--4.EMPLOYEES cədvəlində first_name sütunundakı dəyərlərinin uzunluğunu last_name sütunundakı dəyərlərinin uzunluğunu 
--   böldükdə alınan qalıq 2 -dən böyük olan əməkdaşların məlumatını ekrana çıxardın.   
   
    select e.*
    from employees e
    where mod(length(first_name),length(last_name))>2;
    
--5.Serverin cari tarix və vaxtını ekrana çıxardın.

select sysdate from dual;

--6.EMPLOYEES cədvəlində hire_date sütunu üçün aşağıdakı əməliyyatları yerinə yetirin  
--   e) hire_date sütununda olan dəyərlərin ayın son günlərini ekrana çıxardın 


select hire_date,
last_day(hire_date) as ayin_sonu
from employees;

--   f) hire_date sütununda olan dəyərləri ay və il üzrə yuvarlaqlaşdırın

select round(TO_DATE(hire_date)),
ROUND (hire_date,'month') as ay_uzre,
ROUND (hire_date,'year') as il_uzre
from employees;

--   g) hire_date sütununda olan dəyərləri rəqəm ilə ay və il olaraq göstərin (məsələn 052020) 

select to_char(hire_date, 'mmyyyy')
from employees;

--   h) hire_date sütununda olan dəyərlərdən rəqəm ilə tam ili ekrana çıxardın

    select extract(year from hire_date) from employees;

--   i) hire_date sütununda olan dəyərlərdən ili yazı ilə ekrana çıxardın 

 select 
 to_char(hire_date,'year')
 from employees;

--   j) hire_date sütununda olan dəyərlərdən ay üçün iki rəqəmli dəyəri ekrana çıxardın  

select to_char(hire_date,'mm') from employees;

--   k) hire_date sütununda olan dəyərlərdən ayın tam adını ekrana çıxardın  

select to_char(hire_date,'month') from employees;

--   l) hire_date sütununda olan dəyərlərdən ayın adını qısaldaraq üç hərf şəklində ekrana çıxardın

select to_char(hire_date,'mon')
from employees;

--   m) hire_date sütununda olan dəyərlərdən həftənin günlərinin üç hərf şəklində ekrana çıxardın

select to_char(hire_date,'dy') from employees;

--   n) hire_date sütununda olan dəyərlərdən həftənin günlərinin tam adını ekrana çıxardın

select to_char(hire_date,'day') from employees;

--   o) hire_date sütununda olan dəyərlərdən ayın rəqəm gününü ekrana çıxardın 

select to_char(hire_date,'dd')
from employees;


--   p) hire_date sütununda olan dəyərlərə 24 saatlıq dəyər üzrə saat, dəqiqə və saniyə formatını tətbiq edin 
    
    select to_char(hire_date,'hh24:mi:ss')
    from employees;
    
-- 7. EMPLOYEES cədvəlində employee_id və salary sütunun dəyərlərini simvol tipinə çevirin.

    select to_char(employee_id),to_char(salary) from employees;
    

-- 8. EMPLOYEES cədvəlində commission_pct sütunun NULL dəyərlərini 0 dəyəri ilə əvəz edin

    select nvl(commission_pct,0) from employees;

-- 9. EMPLOYEES cədvəlində first_name və last_name sütunlarının uzunluqları eyni olan məlumatları   ekrana çıxardın. 

select * from employees
where length(first_name)=length(last_name) ;


--10.EMPLOYEES cədvəlində hire_date sütunu üçün aşağıdakı əməliyyatları yerinə yetirin
--   a) hire_date sütunundakı dəyərlərin 45 gün əvvəl və 45 gün sonrakı tarixləri ekrana çıxardın

    select hire_date+45 as "45_gun_sonra",
    hire_date-45 as "45_gun_evvel"
    from employees;
    

--   b) cari tarix ilə hire_date sütunundakı tarixlər arasındakı ayları illə göstərən sorğu yazın. 

    select round(months_between(sysdate,hire_date)/12,0) from employees;

--   c) hire_date sütunundakı dəyərlərin üzərinə 15 ay əlavə edərək alınan tarix dəyərinin üzərinə 20 gün əlavə edərək 
--      alınan dəyəri ekrana çıxardın.

select add_months(hire_date,15)+20 from employees;

--   d) SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY günlərinin hansı tarixə düşəcəyini müəyyən edin.   

select hire_date,to_char(hire_date,'fmday'),
       next_day(hire_date,'sunday')as sunday,
       next_day(hire_date,'monday') as monday,
       next_day(hire_date,'TUESDAY') as TUESDAY,
       next_day(hire_date,'WEDNESDAY') as WEDNESDAY,
       next_day(hire_date,'THURSDAY') as THURSDAY,
       next_day(hire_date,'FRIDAY') as FRIDAY,
       next_day(hire_date,'SATURDAY') as SATURDAY
from employees;

--   e) hire_date sütununda olan dəyərlərin ayın son günlərini ekrana çıxardın 

    select hire_date,last_day(hire_date) from employees;

--11.EMPLOYEES cədvəlində first_name sütununun dəyərinin uzunluğunu 40 simvol olmaqla sağ tərəfə '*', last_name sütununun 
--  dəyərinin uzunluğunu 30 simvol olmaqla sol tərəfə '*' simvollarını əlavə edin.
   
   select RPAD(first_name, 40, '*'),lpad(last_name,30,'*') from employees;
   
--12.EMPLOYEES cədvəlində phone_number sütununun dəyərlərinin içərisində olan '.' -i '-' -ilə əvəz edin. 

    select replace(phone_number,'.','-') from employees;

-- 13. Adında "s" hərfi (“s” hərfinin böyük və kiçik hərf olsada yoxlamada iştirak etsin), soyadının ikinci simvolu isə 
--     balaca "t" hərfi olan əməkdaşların adadını, soyadını, əmək haqqı   və işə qəbul tarixi haqqında məlumatları ekrana 
--     çıxardan sorğunu yazın (like -dan istifadə etmədən).  

    select e.*
    from employees e
    where instr(lower(first_name),'s',1)>0 and substr(lower(last_name),2,1)='t' ;

-- 14. first_name sütununda iki və ya daha çox sayda "a"(“a” hərfinin böyük və kiçik hərf olsada yoxlamada iştirak etsin) 
--     olan əməkdaşların məlumatlarını göstərin. 

    select e.*
    from employees e
    where instr(lower(first_name),'a',1,2)>0;
