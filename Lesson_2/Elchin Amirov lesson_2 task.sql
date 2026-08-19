-- 1. 2004-cü ildə işə qəbul edilmiş hər bir işçinin soyadını və işə qəbul_tarixini göstərin. 

    select last_name,
    hire_date
    from employees
    where hire_date between '01-01-04' and '31-12-04' ;
     
-- 2. Meneceri olmayan bütün işçilərin soyadını və iş yerini(job_id) göstərin. 
  
     select 
     last_name,
     job_id
     from employees
     where manager_id is null;
      
-- 3. Əmək haqqı 12000 -dən çox olan əməkdaşların məlumatlarını ekrana çıxardan sorğunu yazın. 

     SELECT*
     FROM employees
     where salary>12000;
       
-- 4. Əmək haqqı 5000 və 12000 intervalına daxil olmayan məlumatları ekrana çıxardan sorğunu yazın.

      SELECT*
      FROM employees
      where salary<5000 or salary>12000;
      
    
-- 5. 20.02.2008 (20-feb-08) və 01.05.2008(1-may-08) tarixləri arasında işə qəbul olan əməkdaşların məlumatlarını
--    ekrana çıxardan sorğunu yazın.  
     
      select * 
      from employees
      where hire_date 
      between '20.02.08' and '01.05.08';
     
-- 6. İşi(JOB_ID) ST_CLERK və SA_REP olan və əmək haqqı 2500, 3500 və 7000 bərabər olmayan məlumatları ekrana 
--    çıxardan sorğunu yazın.   

        select * from employees
        where (job_id='ST_CLERK' or job_id='SA_REP') and salary not in (2500,3500,7000);
   
-- 7. Adında üçüncü simvolu balaca "a" hərfi olan məlumatları ekrana çıxardan sorğunu yazın.

        select * from employees
        where first_name like '__a%';

-- 8. 20 və 50 nömrəli departamentlərdə işləyən və əmək haqqı 6000 və 15000 intervalında olan məlumatları ekrana 
--    çıxardan sorğunu yazın.
   
       select * from employees
       where (department_id=20 or department_id=50) and salary between 6000 and 15000;
   
-- 9. select * from employees where hire_date between '17-jun-03' and '21-sep-05' sorğusunda between əvəzinə 
--    mətiqi operatorlardan(and, or, not in) istifadə edərək yuxardakı sorğu ilə eyni nəticəni qaytaran analoji 
--    sorğunu yazın.
        
        select * from employees
        where hire_date >= '17-06-03' and hire_date <= '21-09-05';
        
-- 10.select * from table_name where 1 = 1 sorğu(table_name yerində istənilən cədvəl ola bilər) nəticə 
--    qaytaracaqmı? Nəticə qaytaracaqsa bu prosesin necə baş verdiyini izah edin.
      
      select * from employees
      where 1=1 ; --Bəli bütün sütunları qaytaracaq, çünki true mənasına gəlir.
      
-- 11.select * from table_name where null = 1 sorğu(table_name yerində istənilən cədvəl ola bilər) nəticə 
--    qaytaracaqmı? Nəticə qaytaracaqsa bu prosesin necə baş verdiyini izah edin.

    select * from employees
    where null=1; --Sütundan uyğun heç bir sətir qaytarmayacaq çünki null=1 ifadəsi doğru deyil.
      
-- 12.Aşağıda qeyd olunan şəkildə cədvəl verilmişdir. Cədvəldə sütunlar aşağıdakı məlumatı ifadə edir
      CustomerİD – müştərinin unikal kodu
      Name  - Ad soyad
      Contract_start_Date – Müqavilənin başlama tarixi
      Contract_End_Date – Müqavilənin bitmə tarixi
      Contract_Type – Müqavilənin tipi
        
      CustomerİD   Name         Contract_start_data Contract_end_date Contract_type
          1      Məmmədov Samir    10.11.2019           10.11.2020       Deposit
          2      Əliyev Əhməd      12.08.2018           12.08.2021       Credit
          3      Ağayeva Təhminə   25.01.2019           25.07.2023       Credit
          4      Əhmədov Nahid     15.04.2021           15.10.2022       Account


      - Cari günün 15.09.2022(15-sep-22) olduğunu nəzərə alaraq müddəti bitməmiş müqavilələri əldə etmək üçün 
        lazım olan sorğu
        
       select * from Cedvel
       where Contract_end_date > '15-09-22';
         
      - Credit tipli müqavilələri əldə etməyimiz üçün SQL sorğusu
         
        select * from Cedvel
       where Contract_type = 'Credit';
         
      - Müddəti bitməmiş kredit müqavilələrinin sorğusu 
           
          select * from Cedvel
       where Contract_end_date > '15-09-22' and Contract_type = 'Credit';
           
--13. Aşağıdakı cədvələ iki sayda sorğu yazılmışdır. 1ci və 2ci sorğu hansı nəticələri ekrana gətirəcəkdir  
--    (ekrana gələcək sərtin İD-sini qeyd edin) və nəticələr eyni olarsa və ya fərqli olarsa, bunun səbəbini izah 
--    edin.
        Name_And_City
        ID    Name      City        Income
        1     Ali       Baku         3000
        2     Ahmad     Sumgayıt     1500
        3     Akbar     Ganja        1500
        4     Sanubar   Ganja        1300
        5     Tahir     Jalilabad    6000
        6     Aysel     Shamaxı      800
        7     Sanubar   Tovuz        900
    Sorğu 1. Select * from Name_and_city where Name='Ali' or Name='Sanubar' and Income<1000;
            cavab=1 və 7 --Çünki burada and operatoru ilk öncə test olunur və false (0) verir daha sonra isə or (toplama məntiqi ilə).
   
    Sorğu 2. Select * from Name_And_City where Name='Ali' and Income < 1000 or Name='Sanubar';
            cavab=4 və 7 --Burada isə yenə eyni qayda ilə hesablanır. Fərq and operatorunun mövqeyidir. Çünki and əsasən ilk hesablama aparılır.
    
--14.Aşağıda qeyd olunan cədvəldə malın İD-si, sayı, qiyməti və məbləği əks olunmuşdur.Cədvəlin bəzi sətirlərində
--   hesablama səhvdir, yəni say*qiymət məbləğə bərabər deyil. Hesablamanın səhv olduğu sətirləri ekrana çıxaran sorğu
--   yazın. 
    
    Product_İD  Price Unit_Count  Total_amount
         1       12         4          44
         2        5         7          35
         3        3         25         75
         4       10         4          30
         5       12         3          36
         6       8          4          32
         
         select * from Cedvel
         where price * unit_count <> total_amount ;

--15. Əmək haqqı 7000-dən böyük olan və ya vəzifəsi SA_REP olan, amma eyni zamanda 50 nömrəli departamentdə işləyən işçilərin məlumatlarını ekrana çıxardan sorğunu yazın.
    
    SELECT*
    FROM employees
    where (salary >7000 or job_id='SA_REP') and department_ıd=50 ;

--16. İşə başlama tarixi 01-JAN-2005-dən sonra olan və ya maaşı 6000-dən az olan, amma eyni zamanda 'IT_PROG' və ya 'ST_CLERK' vəzifələrində işləyən əməkdaşların məlumatlarını
      ekrana çıxardan sorğunu yazın. 

        select * from employees
        where (hire_date>'01-01-05' or salary<6000) and (job_id='IT_PROG' or job_id='ST_CLERK') ; 

--17. Maaşı 5000-dən böyük olan işçiləri maaşlarına görə azalan sırayla və işə başlama tarixlərinə görə artan sırayla sıralayan sorğunu yazın.

    select * from employees
    where salary>5000
    order by salary desc, hire_date asc;

--18. 50 nömrəli departamentdə işləyən və 'IT_PROG' vəzifəsinə malik olan işçiləri maaşlarına görə azalan sırayla və employee_id-lərinə görə artan sırayla necə sıralaya bilərik?

    select * from employees
    where department_id=50 and job_id='IT_PROG'   
    order by salary desc, employee_id asc;

--19. commission_pct sütununa görə sıralanmış işçiləri, komissiya faizi olmayan işçiləri əvvəl göstərməklə necə sıralaya bilərik? 
    
   --1) 
    select * from employees 
    order by commission_pct desc;

    --2) 
    select * from employees
    order by commission_pct asc nulls first;
--20. commission_pct sütununa görə sıralanmış işçiləri, komissiya faizi olmayan işçiləri sonda göstərməklə necə sıralaya bilərik?   

   --1)
    select * from employees 
    order by commission_pct asc;

    --2)
    select * from employees 
    order by commission_pct desc nulls last;
   
         
  
