/*
Bu dərsdə SQL -də mövcud olan faydalı funksiyalardan bəhs ediləcək.
SELECT bəyanatlarında simvol, rəqəm və tarix(character, number, date) funksiyalarından istifadə olunması.
Konvertasiya(çevirmə) funksiyalarından istifadə.

Funksiyalar əsas sorğu blokunu daha güclü edir və məlumat dəyərlərini manipulyasiya (dəyişiklik) etmək üçün istifadə edilir.
Bu iki dərsdən birincisidir, hansı ki, funksiyalar baxılır.
Single-row funksiyaları vasitəsilə SELECT bəyanatlarında simvol, rəqəm və tarix(character, number, date) funksiyalarından istifadəsindən başqa bir məlumat tipindən digər məlumat tipinə 
çevirmə əməliyyatları yerinə yetirilir. Misal: Simvol tiplərini rəqəm tipinə çevirmək(konvertasiya etmək).

                            _ _ _ _ _ _ _ _ _ _ _   
           _ _ _ _ _ _ _ _ |                     |
          |      _ _ _ _ _ |    Funksiya         |_ _ _ _ _ _ _ _ _ _  Çıxış
          |     |      _ _ |                     |                   |
          |     |     |    |_ _ _ _ _ _ _ _ _ _ _|                   |
          |     |     |                                              |
   _ _ _ _ _    |     |     funksiya yerinə yetirir                  |
  |         |   |     |                                              | 
  |  arg 1  |   |     |                                              |
  |_ _ _ _ _|   |     |                                _ _ _ _ _ _ __ _ _ _ _ _ _
        _ _ _ _ _     |                               |                          |                      
       |         |    |                               |                          |  
       |  arg 2  |    |                               |                          |
       |_ _ _ _ _|    |                               |   Nəticənin dəyəri       |
                      |                               |                          | 
          •           |                               |                          |
            •         |                               |_ _ _ _ _ _ __ _ _ _ _ _ _| 
              •       |                               
               _ _ _ _ _
              |         |
              |  arg n  | 
              |_ _ _ _ _|
       

  SQL funksiyaları 
  
  Funksiyalar SQL-in çox güclü bir xüsusiyyətidir və aşağıdakıları etmək üçün istifadə edilə bilər:
         
    * Məlumatlarda hesablamaları yerinə yetirmək üçün
    * Məlumatların ayrı elementlərini dəyişdirmək 
    * Sətir grupları üçün nəticəni manipulyasiya (dəyişiklik) etmək üçün 
    * Tarix və rəqəm(say) tiplərini ekranda göstərmək üçün format etmək 
    * Sütunun məlumat tipləri dəyişdirmək
  
  SQL funksiyaları bəzən parametr qəbul edir və həmişə nəticə qaytarır.
  Bu dərsdə təsvir edilmiş funksiyaların əksəriyyəti Oracle korporasiyasının SQL-ı versiyasına aiddirlər.
  
  
  SQL funksiyalarının növləri(Tipləri)
    SQL funksiyalarının iki növü(tipi) var
     
      *  Single-row functions
      *  Multiple-row functions
  
                                        _ _ _ _ _ _ _ _ _ _ _
                                       |                     |
                                       |                     |
                                       |     Funksiyalar     |
                                       |                     |
                                       |_ _ _ _ _ _ _ _ _ _ _|
                                                  | 
                                                  |            
                                                  | 
                  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _              
                 |                                                                 |
                 |                                                                 |
                 |                                                                 |
             
             Tək sətir qəbul edir                                             Çox sətir qəbul edir 
             _ _ _ _ _ _ _ _ _ _ _ _                                             _ _ _ _ _ _ _ _ _ _ _ _ 
            |                       |                                Sətir  --> |                       |
 Sətir ---> | Single-row functions  | --> Tək sətir qaytarır         Sətir  --> | Multiple-row functions| --> Tək sətir qaytarır
            |_ _ _ _ _ _ _ _ _ _ _ _|                                Sətir  --> |_ _ _ _ _ _ _ _ _ _ _ _| 
                      
      
 
 Single-Row Functions
 Bu funksiyalar cədvəlin hər bir sətri üçün bir nəticə qaytarır. Single-Row funksiyaların müxtəlif tipləri mövcuddurlar. Bu dərsdə aşağıdakı tiplərə baxılacaq:
   • Character
   • Number
   • Date
   • Conversion

 Multiple-Row Functions
   Multiple-Row funksiyalar 0 və ya daha çox sətirlər üçün bir nəticə qaytarır. Bu funksiyalar qrup funksiyaları kimi tanınır. 
   
 Single-Row funksiyalar
   • Məlumatların elementlərini manipulyasiya etmək(dəyişdirmək)       
   • Argumentlləri(dəyərləri) qəbul edir və geriyə tək nəticə qaytarır
   • Hər bir qaytarılan sətir üçün yerinə yetirilmə 
   • Hər sətir üçün bir nəticə qaytarır.
   • Məlumat tipini dəyişdirə bilər 
   • İç -içə istifadə oluna bilər
   • Arqument(dəyər) kimi sütun və ya ifadə qəbul edə bilər.
   
   function_name [(arg1, arg2,...)]
   
   Bir və ya daha çox arqument(dəyər) qəbul edir və sorğu ilə geri qaytarılmış hər bir sətir üçün bir dəyəri qaytarırlar. Arqumentlər(dəyərlər) aşağıdakılardan biri ola bilər:
   
    • İstifadəçi tərəfindən təyin olunan sabit(constant)
    • Dəyişənin qiyməti
    • Sütun adı
    • İfadələr(Expression) 
   
   Single-Row funksiyaların xüsusiyyətləri bunlardır.
    • Sorğuda qaytarılan hər sətir üçün yerinə yetirilmə
    • İstinad edilən məlumat tipindən fərqli tip məlumat qaytara bilər
    • Bir və ya bir neçə arqument(dəyər)  qəbul edə bilər
    • SELECT, WHERE və ORDER BY bəndlərində istifadə oluna bilər
    
   Sintaksis
    function_name - funksiyanın adı
    arg1, arg2..  - funksiyanın qəbul etdiyi arqumentlər(dəyərlər)
    
    
    
     Single-Row funksiyalar
                                              _ _ _ _ _ _ _ _ _ 
                                             |                 |
                                             |    Character    |
                                             |_ _ _ _ _ _ _ _ _| 
                                                     |  
                                                     |
                                                     |
                _ _ _ _ _ _ _ _ _         _ _ _ _ _ _ _ _ _ _ _         _ _ _ _ _ _ _ _ _ 
               |                 |       |                     |       |                 |
               |   General       | - - - |     Single-row      | - - - |      Number     |
               |_ _ _ _ _ _ _ _ _|       |     funksiyalar     |       |_ _ _ _ _ _ _ _ _|
                                         |_ _ _ _ _ _ _ _ _ _ _|
                                        /                       \ 
                                       /                         \
                                      /                           \
                              _ _ _ _ _ _ _ _ _           _ _ _ _ _ _ _ _ _
                             |                 |         |                 |
                             |   Conversion    |         |      Date       |
                             |_ _ _ _ _ _ _ _ _|         |_ _ _ _ _ _ _ _ _|
     
     
    • Character funksiyalar: Parametr olaraq simvol tipi qəbul edir simvol və rəqəm qaytara bilər
    • Number funksiyalar: Parametr olaraq rəqəm qəbul edir və rəqəm qaytarır
    • Date funksiyalar: Date məlumat tipləri ilə işləmək üçün istifadə edilir. Bütün Date funksiyaları DATE məlumat tipi qaytarır təkcə MONTHS_BETWEEN funksiyası rəqəm qaytarır.
    • Conversion funksiyaları: Dəyəri bir məlumat tipindən digərinə çevirir.
    • General funksiyaları: 
           – NVL
           – NVL2
           – NULLIF
           – COALSECE
           – CASE
           – DECODE

                              _ _ _ _ _ _ _ _ _ _ _         
                             |                     |      
                             |     Single-row      | 
                             |     funksiyalar     |       
                             |_ _ _ _ _ _ _ _ _ _ _|
                                        |
                                        |
                                        |
              _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ _ _ _ _ _ _ _ _
             |                                                        |
             |                                                        |
             |                                                        |
         _ _ _ _ _ _ _ _ _ _ _ _ _                _ _ _ _ _ _ _ _ _ _ _ _ _      
        |                         |              |                         |
        |   Case-manipulation     |              | Character-manipulation  |
        |       functions         |              |     functions           | 
        |_ _ _ _ _ _ _ _ _ _ _ _ _|              |_ _ _ _ _ _ _ _ _ _ _ _ _|
          
                  LOWER                                     CONCAT  
                  UPPER                                     SUBSTR 
                  INITCAP                                   LENGTH
                                                            INSTR
                                                            LPAD | RPAD
                                                            TRIM
                                                            REPLACE
                                                            
                                                            
   Character Functions
     Character(Simvol) single -row funksiyalar parametr olaraq character(simvol) qəbul edir nəticə olaraq character(simvol) və rəqəm(number) qaytarır. Character(Simvol) funksiyaları
     aşağıdakılara bölmək olar:       
         
        • Case-manipulation funksiyaları (Registrın(böyük,kiçik hərf) manipulyasiya(dəyişdirmə) funksiyaları)
        • Character-manipulation funksiyaları(Simvolların manipulyasiya(dəyişdirmə) funksiyaları)
        
   
   Case Manipulation funksiyaları
     LOWER, UPPER və INITCAP bu üç funksiya case-conversion funksiyalardır.
     
     LOWER(column|expression)   - Bu funksiya hərfi simvolların qiymətlərini alt registrə dəyişdirəcək(simvolların hamısını kişik hərfə çevirir). LOWER funksiyası sabit(təyin 
     olunmuş) uzunluqlu dəyər qaytarır əgər daxil olan arqument(dəyər) sabit(təyin olunmuş) uzunluqlu dəyərə malikdirsə. LOWER simvol dəyərində hərf olmayan dəyərləri dəyişdirməyəcək, 
     hansılar ki, rəqəmlər xususi simvollar ($,% və s.).
      
        Misal1: select lower('SQL Course') from dual;
        Misal2: select lower('DATABASE@456') from dual;
        Misal3: select employee_id,
                       lower(first_name) as first_name,
                       lower(last_name) as last_name
                  from employees e
                 where lower(first_name) = 'steven';        
         
        
     UPPER(column|expression)   - Bu funksiya hərfi simvolların qiymətlərini yuxarı registrə dəyişdirəcək(simvolların hamısınl böyük hərfə çevirir). UPPER funksiyası sabit(təyin 
     olunmuş) uzunluqlu dəyər qaytarır əgər daxil olan arqument(dəyər) sabit(təyin olunmuş) uzunluqlu dəyərə malikdirsə. UPPER simvol dəyərində hərf olmayan dəyərləri dəyişdirməyəcək, 
     hansılar ki, rəqəmlər xususi simvollar ($,% və s.). 
        Misal1: select upper('SQL Course') from dual; 
        Misal1: select upper('dbms$508%7') from dual;
        Misal3: select employee_id,
                       upper(first_name) as first_name,
                       upper(last_name) as last_name
                  from employees e
                 where upper(first_name) = 'STEVEN';
     
     
     INITCAP(column|expression) - Hər sözün ilk hərfini böyük hərfə, qalan hərfləri kiçik hərflərə çevirir
       Misal1: select initcap('SQL COURSE') from dual; 
       Misal2: select employee_id, 
                      first_name,
                      last_name,
                      email,
                      initcap(email) as emailIn
                 from employees
                where initcap(email) = 'Ahunold';
     
     
           
         
  Character-Manipulation funksiyalar
  
    LENGTH(column|expression) - Bu funksiya giriş sətirinin uzunluğunu qaytarır. Giriş sətri NULL olduqda, LENGTH funksiyası sıfır deyil, NULL verir. Ayrıca, giriş sətrində 
    başlanğıcda və ya sətrin aralarında və ya sonunda əlavə boşluq varsa, LENGTH funksiyası əlavə boşluqları da nəzərə alır və sətrin tam uzunluğunu qaytarır.
       Misal1: select length('HelloWorld') from dual;
       Misal2: select length('   Write an Interview  Experience ') from dual;
       Misal3: select length('') from dual; və ya select length(null) from dual;
       Misal3: select employee_id, 
                      first_name,
                      last_name,
                      length(email) as len
                 from employees;
    
    CONCAT(column1|expression1, column2|expression2) - birinci simvol dəyərlərini ikinci simvol dəyərləri ilə birləşdirir. || -operatoru ilə eyni işi görür. Ancaq CONCAT funksiyası
    2 simvol dəyərini birləşdirir. || -operatoru isə ikidən artıq simvol dəyərlərini birləşdirir. Argumentlərdən biri NULL olarsa, CONCAT funksiyası NULL olmayan arqumenti qaytarır.
    Hər argument(dəyər) NULL olsa, CONCAT funksiyası NULL qaytarır. 
      Misal1: select CONCAT('Hello', 'World') from dual;  
      Misal2: select employee_id, 
                      concat(first_name, last_name),
                      email
                 from employees
                where concat(first_name, last_name) = 'NeenaKochhar';    
                   
   
    SUBSTR(column|expression,m [,n]) - simvol dəyərindən müəyyən edilmiş uzunluqda simvolları çıxartmaq üçün istifadə olunur. m mənfi olarsa, say simvol dəyərinin sonundan başlayır.
    Əgər n qeyd olunmayıbsa m başlanğıc dəyərindən asılı olaraq sətrin sonuna qədər olan bütün simvolları qaytarır.  
      Misal1: select SUBSTR('HelloWorld',1,5) from dual;    
      Misal2: select substr('HelloWorld',-5,5) from dual;  
      Misal3: select substr('Database Management System', 9) from dual;  
       
   INSTR(column|expression,'string', [,m], [n]) - Bu funksiya string arqumentinin(dəyərinin) simvol dəyəri içərisindəki mövqeyinin qiymətini qaytarır. m qeyd olunması məcburi deyil.
   m string argumentinin(dəyərinin) simvol dəyəri içərisindən axtarışa başlayacağı mövqeyi bildirir. Susmaya görə 1 qiymətini alır. m -in qiyməti mənfi olduqda axtarış sondan əvvələ
   əvvələ aparılır. n simvol dəyəri içərisindən 'string' argumentinin    
   
   This is a playlist 
   T h i s   i s    a     p  l  a  y  l  i  s  t
   1 2 3 4 5 6 7 8  9 10 11 12 13 14 15 16  17 18
   
   1. Aşağıdakı sorğu "This is a playlist" simvol dəyərinin içərisindən  "is" dəyərinin yerləşdiyi mövqeyin qiymətini qaytarır. m və n dəyərləri qeyd olunmadığı üçün susmaya görə 1
      qiymətini alırlar. 
        
      select instr( 'This is a playlist', 'is' ) substring_location from dual;
      
   2. Aşağıdakı sorğu "This is a playlist" simvol dəyərinin içərisindən  "is" dəyərinin yerləşdiyi müxtəlif mövqeylərin qiymətini qaytarır. m = 1 qiyməti onu göstərir ki axtarış 1-ci  
      mövqedən başlayacaq.   
   
      select instr('This is a playlist', 'is', 1, 2), --"This is a playlist" simvol dəyərinin içərisində "is" parametrinin yerləşdiyi 2-ci mövqeyin qiymətini qaytarır 
             instr('This is a playlist', 'is', 1, 3)  --"This is a playlist" simvol dəyərinin içərisində "is" parametrinin yerləşdiyi 3-cü mövqeyin qiymətini qaytarır
        from dual;
   
   3. Aşağıdakı sorğu "This is a playlist" simvol dəyərinin içərisində olmayan olmayan "are" dəyərinin axtarışını bildirir.
   
      select instr( 'This is a playlist', 'are' ) substring_location from dual;
      
   4. Sondan əvvələ axtarış.
      
      select instr('This is a playlist', 'is', -1) substring_location from dual;
      select instr('This is a playlist', 'is', -1,2) substring_location from dual;
      
   LPAD(column|expression, n, 'string') -funksiyası n -nin qiymətinə uyğun simvol dəyərinin uzunluğunu saxlamaqla simvol dəyərinin sol hissəsinə 'string' dəyərini əlavə edir. Simvol dəyəri 
   boş olmasın.
     select lpad('100',5,'*') from dual;
     select lpad('10000',5,'*') from dual;
     select lpad('100000000',5,'*') from dual;
     select lpad('hello', 21, '*') from dual;
     
   RPAD(column|expression, n, 'string') -funksiyası n -nin qiymətinə uyğun simvol dəyərinin uzunluğunu saxlamaqla simvol dəyərinin sağ hissəsinə 'string' dəyərini əlavə edir. Simvol dəyəri 
   boş olmasın.
     select rpad('100',5,'*') from dual;
     select rpad('10000',5,'*') from dual;
     select rpad('100000000',5,'*') from dual;
     select rpad('hello', 21, '*') from dual;    
     
   TRIM(leading|trailing|both, trim_character FROM trim_source) -funksiyası simvol dəyərini başlanğıcdan və sondan ya da hər iki tərəfdən kəsir.
     select trim('*' from '*SQL') from dual;
     select trim('*' from 'SQL*') from dual;
     select trim('*' from '*SQL*') from dual;
     select trim('  SQL') from dual;
     select trim('SQL  ') from dual;
     select trim('  SQL  ') from dual;
     
     select employee_id, concat(first_name, last_name), email
       from employees
      where trim(concat(first_name, last_name)) = trim('   NeenaKochhar      ');
     
   REPLACE(text, search_string, replacement_string) -funksiyası text simvol dəyəri içərisində search_string -dəyərini axtarır tapdıqda replacement_string ilə əvəz edir.
     select replace('DATA MANAGEMENT', 'DATA','DATABASE') from dual;
     select replace('abcdeabcccabdddeeabcc', 'abc') from dual;    


  REVERSE(column|expression) - funksiyası qəbul etdiyi dəyərdəki simvolları tərsinə çevirir. Əgər yalnız REVERSE() funksiyasını çağırırsınızsa, sütunun əsas dəyərləri dəyişməz və 
                               yalnız  tərsinə çevrilmiş halı qaytarılır.

  select reverse('SQL') as result
    from dual; 
     
   Ümumi nünunələr.
   
   select employee_id,
          concat(first_name, last_name) name,
          job_id,
          length(last_name),
          instr(last_name, 'a') "Contains 'a'?"
     from employees
    where substr(job_id, 4) = 'REP';
    
   select employee_id, 
          concat(first_name, last_name) name,
          length (last_name), instr(last_name, 'a') "Contains 'a'?"
     from employees
    where substr(last_name, -1, 1) = 'n';  
    
   select employee_id, first_name, last_name 
     from employees 
    where soundex(first_name) = soundex('Worthen'); 
    
   select last_name
     from employees
    where soundex(first_name) = soundex('whyte');
    
   Number Functions
   
   Number rəqəm funksiyaları parametr olaraq rəqəm qəbul edir və rəqəm qaytarır. 

   ROUND(column|expression, n) -funksiyası sütun, ifadə və ya dəyəri göstərilmiş uzunluğa(n) qədər yuvarlaqlaşdırır. Əgər n-nin qiyməti sıfır olarsa və ya qeyd olunmayıbsa onda 
   kəsr hissəni yuvarlaqlaşdıraraq tam hissəni göstərir. n -qiyməti varsa və mənfi deyilsə onda yuvarlaqlaşdırma kəsr hissədə n -nin dəyəri qədər kəsr hissəni yuvarlaqlaşdırır. 
   n-nin qiyməti varsa və mənfidirsə onda n -nin dəyəri qədər tam hissədə yuvarlaqlaşdırır.
   
   select round(369.157) from dual; 
   select round(369.657) from dual;   
   select round(369.157,0) from dual; 
   select round(369.657,0) from dual;   
   select round(369.657326,2) from dual;
   select round(369.657326,-2) from dual;
   
   Round funksiyası tarix tiplərində də istifadə olunur.
   
   
   TRUNC Function
   TRUNC(column|expression,n) -funksiyası həm müsbət həmdə mənfi ədədlər üçün onluq kəsr hissəsini kənarlaşdırır. TRUNC funksiyası ROUND funksiyasına oxşar arqumentlərlə işləyir.
   Əgər n-nin qiyməti sıfır olarsa və ya qeyd olunmayıbsa onda tam hissəni kəsib çıxarır. n -qiyməti varsa və mənfi deyilsə onda yuvarlaqlaşdırma kəsr hissədə n -nin dəyəri qədər 
   kəsr hissəni yuvarlaqlaşdırır. n -qiyməti varsa və mənfi deyilsə onda kəsr hissədə n -nin dəyəri qədər kəsr hissəni və tam hissə ilə birlikdə kəsir. n-nin qiyməti varsa və 
   mənfidirsə onda n -nin dəyəri qədər tam hissəni kəsir.
   
   select trunc(369.157) from dual; 
   select trunc(369.657) from dual; 
   select trunc(369.157,0) from dual; 
   select trunc(369.657,0) from dual; 
   select trunc(369.657326,2) from dual;
   select trunc(369.657326,-2) from dual;
   
   MOD Function
   MOD(m,n) -bölunənin bölənə bölünməsindən alınan qalığığı göstərir(m -in n -ə bölünməsindən alınan qalıq). Əgər m n-ə tam bölünürsə nəticə sıfır qaytarır.
   select MOD(n,3) from dual;
   select MOD(10,5) from dual;
   
   POWER(m,n) - m -i n -ninci dərəcədən qüvvətə yüksəldir. 
   
   select POWER(2,8) from dual;
   select power(2,4) from dual;
   select power(-2,5) from dual;
   
   SQRT(n) - n -nin kök altısını çıxardır.
   select SQRT(144) from dual;
   
   
   select ceil(1.2) from dual;
   
   
   Tarixlər ilə işləmək
   
   SYSDATE Function
   SYSDATE cari verilənlər bazası server tarixi və vaxtını(ssat) qaytaran bir tarix funksiyasıdır. SYSDATE funksiyasını SELECT bəyanatında sütun adlarının istitifadə olunması kimi
   istifadə edilə bilər.
   
   select sysdate from dual;
   select sysdate,e.employee_id,e.first_name,e.last_name from employees e;
   
   Tarix ilə riyazi əməliyyatlar.
   
   Verilənlər bazası tarixləri rəqəm şəklində saxladığına görə toplama və çıxma kimi riyazi operatorlardan istifadə edərək hesablamalar apara bilərik. Tarix məlumatının üzərinə rəqəm
   əlavə edə, çıxa, iki tarix məlumatını bir birindən çıxa bilərik.
   
   Operation           |    Result      |   Description
   _ _ _ _ _ _ _ _ _ _ |_ _ _ _ _ _ _ _ |_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
   date + number       | Tarix(Date)    | Tarixə günlərin sayını əlavə edir
                       |                |
   date - number       | Tarix(Date)    | Tarixindən günlərin sayını çıxır 
                       |                |
   date - date         | Günlərin sayı  | Bir tarixi digərindən çıxarır
                       |                |
   date + number/24    | Tarix(Date)    | Tarixə saat əlavə edir
   
   
   select employee_id,
          first_name,
          last_name,
          hire_date,
          hire_date + 10,
          hire_date - 10,
          sysdate - hire_date,
          (sysdate-hire_date)/7 as weeks
     from employees e;
  
  Date Functions   
  Oracle verilənlər bazası tarix məlumatlarını əsr, il, ay, gün, saat, dəqiqə və saniyə formatda saxlayır.
  Tarix məlumatları Oracle verilənlər bəzasında rəqəm şəklində saxlanılır. 
  
  CENTURY  YEAR  MONTH DAY HOUR MINUTE SECOND
   20     2020    04   30   6     15    53
   
  Bütün Tarix funksiyaları DATE məlumat tipinin qiymətini qaytarır, MONTHS_BETWEEN-dən başqa. MONTHS_BETWEEN rəqəm tipi qaytarır.
  
    MONTHS_BETWEEN(date1, date2): Verilən tarixlər arasında ayların sayını qaytarır. Nəticə müsbət və ya mənfi ola bilər. Əgər date1 date2 -dən böyükdürsə nəticə müsbət kiçikdirsə
    nəticə mənfi olur.
    
     select months_between('01-jan-2010','01-jan-2009') from dual;    
     select months_between('01-jan-2009','01-jan-2010') from dual; 
     select months_between(sysdate, hire_date) from employees;
     
    ADD_MONTHS(date, n) - date tarix, n isə ayların sayını bildirir. Bu funksiya tarixin üzərinə ayların sayını əlavə edərək yeni tarix dəyəri qaytarır. n müsbət və mənfi dəyərləri 
    ala bilər. 
    
    select employee_id,
           first_name,
           last_name,
           hire_date,
           add_months(hire_date,3),
           add_months(hire_date,-3) 
      from employees ;
  
    NEXT_DAY(date, 'char'): date tarix, char isə həftənin günlərini bildirir. Verilən tarixdən sonra gələcək həftənin günü üçün tarixi qaytarır.
    Həftinin günləri.
    
    SUNDAY 
    MONDAY 
    TUESDAY 
    WEDNESDAY 
    THURSDAY 
    FRIDAY 
    SATURDAY
    
    select employee_id,
           first_name,
           last_name,
           hire_date,
           next_day(hire_date, 'TUESDAY'),
           next_day('30-apr-20', 'MONDAY')
      from employees 
    
    LAST_DAY(date): Verilən tarixdəki ayın son gününü qaytarır.
       select LAST_DAY('05-oct-2020') from dual;   
    
    ROUND(date[,'fmt']): Verilən tarix formatından asılı olaraq günə, aya, ilə, saat və ya dəqiqəyə qədər yuvarlaqlaşdırır. Əgər fmt parametri verilməyibsə tarix günə uyğun olaraq
    yuvarlaqlaşdırır. Əgər tarix 1 - jan -2015 19:53 -dürsə günə görə yuvarlaqlaşdırır və tarix 2 - jan -2015 00:00 olacaq.  
    
      select round(sysdate) from dual;
      select round(sysdate,'MONTH') from dual;         
      select round(sysdate ,'YEAR') from dual;  
      select round(to_date('25.07.2020','dd.mm.yyyy') ,'YEAR') from dual;      
     
    
    TRUNC(date[, 'fmt']): Verilən tarix formatından asılı olaraq günə, aya, ilə, saat və ya dəqiqəyə kimi kəsir. Əgər fmt parametri verilməyibsə tarix günə kimi kəsir. Əgər tarix 
    1 - jan -2015 19:53 -dürsə günə kimi kəsildikdə tarix 1 - jan -2015 00:00 olacaq.  
     
      select trunc(sysdate) from dual;
      select trunc(sysdate ,'MONTH') from dual;         
      select trunc(sysdate ,'YEAR') from dual;  
      
    
   Conversion Functions
   Çevirmə funksiyaları bir məlumat tipini digər məlumat tipinə çevirmək üçün istifadə olunur. Bəzi hallarda oracle server avtomatik olaraq məlumatları tələb olunan 
   tipə çevirir. Buna implicit(aşkar olmayan) çevrilmə deyilir. Aşkar(explicit) çevirmə çevirmə funksiyaları vasitəsilə yerinə yetirilir.
   
                                     _ _ _ _ _ _ _ _ _ 
                                    |                 |
                                    |  Data-type      |
                                    |   conversion    |
                                    |_ _ _ _ _ _ _ _ _|
                                             |
                                             |
                            _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ 
                           |                                   |
                           |                                   |
             _ _ _ _ _ _ _ | _ _ _ _ _ _         _ _ _ _ _ _ _ | _ _ _ _ _ _              
            |                           |       |                           |
            |    Implicit data-type     |       |   Explicit data-type      |
            |       conversion          |       |      conversion           |
            |_ _ _ _ _ _ _ _ _ _ _ _ _ _|       |_ _ _ _ _ _ _ _ _ _ _ _ _ _|         
                            
   
   Implicit Data-Type Conversion
   
   Oracle avtomatik olaraq aşağıdakıları çevirə bilər: 
   
   NUMBER - VARCHAR2
   VARCHAR2 or CHAR - NUMBER
   VARCHAR2 or CHAR - DATE
   DATE - VARCHAR2  
    
   select * from employees where employee_id = '101'; 
   
   
   Explicit Data-Type Conversion
   
   SQL bir məlumat tipini digər məlumat tipinə çevirmək üçün üç funksiyadan istifadə edir.
   
   TO_CHAR(number|date,[ fmt], [nlsparams]): Fmt formatının modelinə uyğun olaraq tarix(date) və rəqəm (number) qiymətlərini VARCHAR2 tipinə çevirir.
   
   
   TO_CHAR funksiyası tarix üçün
      
     TO_CHAR(date, 'format_model') 
       format_model üçün
          
         Tək dırnaqlara bağlanmış olmalıdır və registrə həssasdır(Böyük kiçik hərf)
         Hər hansı bir etibarlı tarix formatı elementini daxil edə bilər. Vergül vasitəsilə format modelində tarixin qiymətini mütləq ayırın.
         Boşluqları silmək əvvəldəki sıfırları gizlətmək üçün fm -dən istifadə olunur
         Çıxış məlumatlarında günlərin və ayların adları avtomatik boşluqlarla əlavə olunur.
         
    select employee_id, 
           hire_date,
           to_char(hire_date, 'MM/YY') month_hired
      from employees
     where last_name = 'Higgins';                                          
    
    Date Format Model -nin elementləri
    
    
    YYYY - rəqəm ilə tam il
     select to_char(sysdate, 'YYYY') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'yyyy') 
       from employees
      where last_name = 'Higgins';
     
    YEAR - İl yazı ilə
      select to_char(sysdate, 'YEAR') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'YEAR') 
       from employees
      where last_name = 'Higgins';
      
    MM - Ay üçün iki rəqəmli dəyər
    
     select to_char(sysdate, 'mm') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'mm') 
       from employees
      where last_name = 'Higgins';
      
    MONTH - Ayın tam adı
     select to_char(sysdate, 'MONTH') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'MONTH') 
       from employees
      where last_name = 'Higgins';
      
    MON -ayın adını qısaldaraq üç hərf şəklində göstərilməsi.
     select to_char(sysdate, 'MON') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'MON') 
       from employees
      where last_name = 'Higgins'; 
    
    DY - Həftənin günlərinin üç hərfli adı  
     select to_char(sysdate, 'dy') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'dy') 
       from employees
      where last_name = 'Higgins'; 
      
    DAY - Həftənin günlərinin tam adı
      select to_char(sysdate, 'DAY') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'DAY') 
       from employees
      where last_name = 'Higgins'; 
      
    DD - Ayın rəqəm günü
     select to_char(sysdate, 'dd') from dual;
     
     select employee_id, 
            hire_date,
            to_char(hire_date, 'dd') 
       from employees
      where last_name = 'Higgins'; 
     
    fm -dən istifadə
    select last_name, 
           to_char(hire_date, 'fmDD Month YYYY') hiredate,
           to_char(hire_date, 'DD Month YYYY') hiredate
      from employees;
      
  select last_name,
         hire_date,
         to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM') hiredate
    from employees;
   
  Saat üçün format.
  select to_char(sysdate,'dd.mm.yyyy hh24:mi:ss')
    from dual;
  
  select last_name,
         hire_date, 
         to_char(hire_date,'dd.mm.yyyy hh24:mi:ss')
    from employees;
    
   
   TO_CHAR rəqəm(NUMBER) tipləri üçün
   
   TO_CHAR(number, 'format_model') number dəyərini simvol tipinə çevirir. Həmçinin number -ə müəyyən formatlar verə bilərik. Ən çox istifadə format kodlarından biri rəqəmi verilmiş müvafiq     formatında göstərməkdir. Bu format kodu 9-dur. Əgər rəqəm onluq formatında 3 rəqəmli olsaydı və əgər rəqəm çoxaltda 3 rəqəm olsa, əvvəlində boşluq olacaqdı.
   
Müxtəlif format elementlərindən istifadə edərək, tələblərinizə əsasən formatı qura bilərsiniz. Rəqəmsal formatlaşdırma üçün bəzi ümumi elementlər daxildir:  

 '9': Rəqəmi təmsil edir.
 '0': Rəqəmi təmsil edir və həmin mövqedə heç bir rəqəm yoxdursa, sıfır göstərilir.
 '.': Onluq nöqtəni təmsil edir.
 'D': Onluq rəqəmi təsvir edir. 
 ',': Minlərin ayırıcısını təmsil edir.
 '$': Valyuta simvolunu təmsil edir.
     
     select to_char(12345.67) from dual;
     select to_char(12345.67, '99999.99') from dual;
     select to_char(12345.67, '99999.9') from dual;
     select to_char(12345, '00000000') from dual;
     select to_char(12345.67, '99,999.99') from dual;
     select to_char(-12345.67, '99,999.99') from dual;
     select to_char(12345.67, '099,999.99') from dual;
     select to_char(12345.67, '99,999.9900') from dual;
     select to_char(12345.67, '$99,999.99') from dual;
     select to_char(12345.67, 'C99,999.99') from dual; 
     select to_char(12345.67, '99999D99')  from dual; 
     select to_char(12345.67, '99999.99EEEE') from dual; 
     select to_char(0012345.6700, 'FM99999.99') from dual;
     select to_char(12345.67, 'U99,999.99') from dual;
     select to_char(12345.67, '99999V99') from dual;
     
   TO_NUMBER funksiyası
   
   TO_NUMBER(char[, 'format_model']) - char parametrini rəqəm tipinə çevirir. Həmçinin char -a müəyyən formatlar verə bilərik.   
   
   select to_number('12345.67') from dual;
   select to_number('12345.67', '99999.99') from dual;
   select to_number('$17,000.23','$999,999.99') from dual;
   
   select to_number('17.000,23',
                   '999G999D99',
                   'nls_numeric_characters='',.'' ') reformatted_number
    from dual;

   
   TO_DATE funksiyası
     TO_DATE(char[, 'format_model']) -char simvol tipini tarix tipinə çevirir. Həmçinin char -a müəyyən formatlar verə bilərik. 
      
     select *
       from employees
      where hire_date = to_date('17.06.2003','dd.mm.yyyy');
      
     select *
       from employees
      where hire_date = to_date('17.06.2003','dd-mm-yyyy');  
     

   RR -formatı 
   
   select trunc(sysdate) from dual;
   
   00-49   
   12.05.0015
   select to_date('12.05.15','dd.mm.RRRR') from dual;
   
   50-99
   12.05.0080
   select to_date('12.05.80','dd.mm.RRRR') from dual;
   
   Nesting Functions 
   
    F3(F2(F1(col,arg1),arg2),arg3)
    
    select length(concat(first_name,last_name))
      from employees

   General Functions

   Bu funksiyalar istənilən məlumat tipiylə işləyir və null dəyərinə də aiddirlər.
   NVL(expr1, expr2) -- Null bir dəyəri həqiqi bir dəyərə çevirir. expr1 dəyəri null deyilsə expr1 dəyərini ekrana çıxarır yox əgər expr1 dəyəri null -sa expr2 ekrana çıxarır.
    select last_name,
           salary,
           commission_pct,
           nvl(commission_pct, 0),
           (salary * 12) + (salary * 12 * nvl(commission_pct, 0)) an_sal
      from employees;

   
   NVL2 (expr1, expr2, expr3) -- expr1 dəyəri null deyilsə NVL2 expr2 dəyərini qaytarır. expr1 dəyəri null -dursa expr3 dəyərini qaytarır.
    select last_name,
           salary,
           commission_pct,
           nvl2(commission_pct, 'SAL+COMM', 'SAL') income
      from employees
     where department_id in (50, 80);

   
   NULLIF (expr1, expr2) - expr1 və expr2 arqumentləri eynidirsə NULL dəyərini qaytarır yox əgər bərabər deyilsə ilk ifadəni qaytarır.
   
    select first_name,
           length(first_name) "expr1",
           last_name,
           length(last_name) "expr2",
           nullif(length(first_name), length(last_name)) result
      from employees;
   
   COALESCE (expr1, expr2, ..., exprn) - İfadə siyahısındakı ilk null olmayan ifadəni qaytarır.   
   
    select last_name, coalesce(commission_pct, salary, 10) comm
      from employees
     order by commission_pct;
     
   CASE Statement
     
   select employee_id,
       first_name,
       last_name,
       case
         when employee_id in (100,104,121) and last_name = 'AAA' then
           'AD_PRES'
         when employee_id = '107' then   
           'IT_PROG'
         else
           'TEST' 
       end as ctest
  from employees;
  
  
  select employee_id,
       first_name,
       last_name,
       decode(employee_id,100,'AD_PRES',104,'AD_PRES')
  from employees;
   

*/ 






