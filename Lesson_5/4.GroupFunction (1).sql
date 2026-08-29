/*
  Qrup funksiyaları nədir? 
  Qrup funksiyalarına bəzən Aggregate (aqreqat) funksiyaları da deyilir. Aggregate funksiyalar sətirlər qrupu üçün müəyyən əməliyyatlar edir və hər bir qrup üçün
  tək sətir qaytarır. Aqreqat funksiyalar sətirlər qrupu üçün bir sətir qaytarır.    
  
  Group funksiyalarının tipləri. 
    
    AVG([DISTINCT|ALL]n) - n dəyərinin orta qiymətini qaytarır. NULL -dəyərləri nəzərə almır.
    
    COUNT({*|[DISTINCT|ALL]expr}) - sətirlərin sayını qaytarır. NULL dəyərləri nəzəzrə almır.
    
    MAX([DISTINCT|ALL]expr) - İfadənin maksimum dəyərini qaytarır. NULL dəyərləri nəzəzrə almır.
    
    MIN([DISTINCT|ALL]expr) - İfadənin minimum dəyərini qaytarır. NULL dəyərləri nəzəzrə almır.  
    
    SUM([DISTINCT|ALL]n) - n dəyərlərinin cəmi. NULL dəyərləri nəzəzrə almır.
    
  
  Group funksiyalarının sintaksisi.

   select [column,] 
          group_function(column), ...
     from table
   [where condition]
   [group by column]
   [order by column];
    
  
  Qrup funksiyalarından istifadə qaydaları(tövsiyələr) 
  
  DISTINCT - funksiyanı yalnız təkrarlanmayan qiymətlərə baxmağa məcbur edir
  ALL - funksiyanı dublikatlar daxil olmaqla bütün qiymətləri nəzərə almağa məcbur edir. ALL qiyməti susmaya görə istifadə olunur, buna görə onu 
        göstərmək lazım deyil.
  
  Expr - arqumenti üçün məlumat tipləri CHAR, VARCHAR2, NUMBER və ya DATE ola bilərlər.
  
  Bütün qrup funksiyaları NULL -dəyərini nəzərə almır. NULL dəyərinin qiymətini dəyişmək üçün NVL, NVL2 və ya COALESCE funksiyalarından istifadə 
  edin.
   
  Oracle Server, GROUP BY -dan istifadə edərkən nəticəni artan sıra ilə sıralayır. Bu sıralamanı dəyişmək üçün DESC -dən istifadə edin
  
  GROUP funksiyalarından istifadə.
  
  1. AVG
    select avg(all salary)
      from employees;
      
    select avg(salary)
      from employees;   
      
    select avg(distinct salary)
      from employees;  
     
  2. SUM
     select sum(all salary)
      from employees;
      
     select sum(salary)
      from employees;
      
     select sum(distinct salary)
      from employees;
     
  3. select max(salary)
       from employees;
  
  4. select min(salary)
       from employees; 

  Yuxarda istifadə etdiyimiz nümunələrdə istifadə olunan grup funksiyaları arqument olaraq rəqəm tipi qəbul edirdi.
  
  İstənilən məlumat tipi üçün MIN və MAX funksiyalarından istifadə edə bilərsiniz.
  
  Tarix tipləri üçün min və max funksiyalarından istifadə.
  select min(hire_date), 
         max(hire_date)
    from employees;
    
  Simvol tipləri üçün min və max funksiyalarından istifadə.  
  select min(last_name), 
         max(last_name)
    from employees;
    
  AVG və SUM funksiyaları yalnız rəqəm tipləri üçün istifadə edilir.
  
  COUNT funksiyası.  
  COUNT funksiyası cədvəldəki sətırlərin sayını qaytarır. COUNT funksiyasının üç formatı var:
     • COUNT(*) 
     • COUNT(expr)
     • COUNT(DISTINCT expr)
     
  COUNT(*) cədvəldə olan sətirlərin sayını qaytarır. Cədvəlin bütün sütunlarında olan NULL dəyərləri, təkrarlanan sətirlər daxil olmaqla bütün
  sütunları hamısını nəzərə alır. Əgər SELECT bəyanatında WHERE ifadəsi daxil edilmişdirsə onda COUNT(*) funksiyası WHERE ifadəsində şərtini
  təmin edən sətirlərin miqdarını qaytarır.     
  
   select count(*)
    from employees;
   
   select count(*)
     from employees
    where department_id = 50;
  
  COUNT(expr) -sütunda NULL olmayan dəyərlərin sayını qaytarır.
  
   select count(commission_pct)
    from employees;
  
   select count(commission_pct)
     from employees
    where department_id = 80;
   
  COUNT(DISTINCT expr) - sütunda boş olmayan və təkrarlanmayan dəyərlərin sayını qaytarır.
   select count(distinct department_id)
     from employees; 
    
  Qrup funksiyaları NULL dəyərləri nəzərə almır. Aşağıdakı nümunədə AVG funksiyası COMMISSION_PCT sütununda NULL dəyərindən fərqli məlumatların 
  orta qiymətini tapır. 
   
    select avg(commission_pct)
      from employees;
      
  NVL funksiyası NULL dəyərlərini GROUP funksiyalarında iştirak etməsinə məcbur edir.
  
  select avg(nvl(commission_pct, 0))
    from employees;
    
  İndiyə kimi baxdığımız GROUP funksiyaları cədvələ məlumatların böyük qrupu kimi baxırdı. Bəzən məlumat cədvəlini daha kiçik qruplara bölmək 
  lazımdır. Bunu GROUP BY -dan istifadə etməklə edilə bilər. Cədvəldəki sətirləri GROUP BY -dan istifadə edərək daha kiçik qruplara bölün.   
  
 GROUP BY
 Cədvəldəki sətirləri qruplara bölmək üçün GROUP BY bəndindən istifadə edə bilərsiniz. Sonra siz hər qrup üzrə qrup (toplu) informasiyanın 
 qaytarılması üçün qrup funksiyalarından istifadə edə bilərsiniz.    
 
   select column, 
          group_function(column)
     from table
   [where condition]
   [group by group_by_expression]
   [order by column];
 
 group_by_expression - sətirlər qruplaşdırılması üçün müəyyən edilən sütunları bildirir
 
 Əgər SELECT bəyanatında qrup funksiyalarından istifadə olunursa SELECT bəyanatında istifadə olunan sütunlar gərək GROUP BY bəndində qeyd olunsun.
 Sütun siyahısını GROUP BY bəndinə daxil edilmədikdə sorğu işlədilən zaman səhv baş verir.
 WHERE -dan istifadə edərək sətirləri qruplara bölməzdən əvvəl WHERE -da şərtləri ödəməyən sətirləri kənarlaşdıra bilərsiniz.
 Sütunları GROUP BY bəndinə daxil etməlisiniz.
 GROUP BY bəndində sütun üçün olan alias -dan istifadə edə bilməzsiniz.  
 Susmaya görə GROUP BY bəndinə daxil olan sütunlar artan sıra ilə sıralanır. ORDER BY ifadəsindən istifadə edərək bunu ləğv edə bilərsiniz.
 
   select department_id, 
          avg(salary)
     from employees
   group by department_id;
   
 SELECT siyahısında bütün sütunlar, hansılar ki, qrup funksiyalarına daxil olmurlar, GROUP BY bəndində olmalıdır.   
    
 GROUP BY -dan istifadə etmək.
 
  GROUP BY təklifindən istifadə vaxtı əmin olun ki, GROUP BY təklifinə SELECT siyahısında bütün sütunlar daxil edilmişdir, hansılar ki, qrup 
  funksiyası deyillər. Yuxarıdakı nümunə depatamentin nömrəsini və hər depatament üçün orta maaşı göstərir.  
  GROUP BY ifadəsini özündə saxlayan bu SELECT bəyanatı bu şəkildə dəyərləndirilir(qiymətləndirilir).
  
     • SELECT bəyanatı qaytarılacaq sütunları təyin edir(müəyyən edir) 
         - EMPLOYEES cədvəlinin department nömrəsi sütunu
         - GROUP BY təklifində sizin tərəfinizdən göstərilmiş qrupda bütün maaşların orta qiyməti
     • FROM bəndində cədvəlləri müəyyən edir(EMPLOYEES cədvəli).  
     
     • WHERE bəndi vasitəsilə əldə ediləcək sətirlər müəyyən edilir.
     
     • WHERE şərti olmadıqda susmaya görə bütün sətirlər götürülür.
     
     • GROUP BY bəndi sətirlərin necə qruplaşdırılacağını göstərir.
   
     • Sətirlər department nömrəsi ilə qruplaşdırılır, buna görə əmək haqqı sütununa tətbiq olunan AVG funksiyası hər şöbə üçün orta əmək haqqını 
       hesablayacaqdır.
  
  GROUP BY bəndində iştirak edən sütunun SELECT bəyanatında iştirak etməyə bilər.
  
       select avg(salary)
         from employees
       group by department_id;
  
  Yuxarıdakı nümunədə SELECT bəyanatı müvafiq department nömrələrini göstərmədən hər şöbənin orta maaşlarını göstərir. Ancaq department nömrələrisiz 
  nəticələr əhəmiyyətli görünmür.
  
  Siz ORDER BY bəndində qrup funksiyasından istifadə edə bilərsiniz.
  
       select department_id, 
              avg(salary)
         from employees
       group by department_id
       order by avg(salary);
       
  Qrupların daxilində qruplar
  Bəzən qrupların daxilindəki qruplar üçün nəticələri görmək lazım olur. 
  
       select department_id dept_id,
              job_id, 
              sum(salary)
         from employees
       group by department_id, 
                job_id;     
  
  Yuxarıdakı nümunədə hər bir department daxilində, hər vəzifəyə ödənilən ümumi əmək haqqını əks etdirən bir hesabatı göstərir. Əvvəlcə EMPLOYEES
  cədvəlində department nömrəsinə görə qruplaşdırılır daha sonra isə bu qrup daxilində vəzifə adına görə qruplaşdırılma aparılır.  
  
  GROUP BY bəndində bir neçə sütundan istifadə olunması
  GROUP BY bəndində birdən çox sütun iştirak edən zaman qruplar və alt qruplar üçün yekun nəticələr qaytara bilərsiniz. Nəticələrin susmaya görə 
  sıralanması qaydası GROUP BY ifadəsindəki sütunların sırasına göre müəyyən edilir.
  
  Aşağıdakı nümunədə GROUP BY ifadəsini özündə saxlayan SELECT bəyanatı bu şəkildə dəyərləndirilir(qiymətləndirilir).  
  select department_id dept_id,
         job_id, 
         sum(salary)
    from employees
   group by department_id, 
            job_id; 
  
  
  • SELECT bəyanatı qaytarılacaq sütunları təyin edir(müəyyən edir) 
       - EMPLOYEES cədvəlinin department nömrəsi sütunu
       – EMPLOYEES cədvəlinin Job ID sütunu 
       - GROUP BY təklifində göstərilmiş qrupda bütün maaşların cəmi 
  • FROM bəndində cədvəlləri müəyyən edir(EMPLOYEES cədvəli).
  
  • GROUP BY bəndi sətirlərin necə qruplaşdırılacağını göstərir.
       – İlk olaraq, sətirlər department nömrəsinə görə qruplaşdırılır.
       - İkinci department nömrəsi qrupunun içərisində job id -yə görə sətirlər qruplaşdırılır
       
 Beləliklə SUM funksiyası department nömrəsi qrupundakı bütün job id sütununa tətbiq olunur.
 
 WHERE bəndində qrup funksiyalarından istifadə etmək olmaz. Aşağıdakı yazılış doğru deyil.
 
   select department_id, 
          avg(salary)
     from employees
    where avg(salary) > 8000
   group by department_id; 
   
 Bu sorğunu işlədən zaman səhv baş verir. Çünki orta əməkhaqqı 8000 dollardan yuxarı olan departamentlərin orta əmək haqqını göstərmək üçün 
 WHERE -dan istifadə edilir. Bu səhvi aradan qaldırmaq üçün HAVING -dən istifadə edilir.
   
   select department_id, avg(salary)
     from   employees
   having  avg(salary) > 8000
   group by department_id;
         
 Seçdiyimiz sətirləri məhdudlaşdırmaq üçün WHERE -dan istifadə etdiyimiz kimi grup fuksiyalarının nəticələrini məhdudlaşdırmaq üçün HAVING -dən 
 istifadə edirik. Əmək haqqı 10000 dollardan yuxarı olan departamentdə hər departament üçün maksimal əmək haqqı tapmaq üçün sorğumuz bu şəkildə
 olur.
    
   select department_id, max(salary)
     from employees
   group by department_id
   having max(salary) > 10000;
   
 Siz SELECT siyahısında qrup funksiyasından istifadə etmədən GROUP BY təklifindən istifadə edə bilərsiniz. Bir qrup funksiyasının nəticəsinə 
 əsasən sətirləri məhdudlaşdırırsınızsa, HAVING bəndində olduğu kimi bir QRUP BY ifadəsi olmalıdır.  
 
   select department_id, 
          salary
     from employees
   group by department_id,
            salary
   having max(salary)>10000;
   
 Aşağıdakı nümunədə maksimum əmək haqqı 10000 dollardan çox olan departamentlərin üçün departamentlərin nömrələri və orta əmək haqqı göstərilir: 
  
   SELECT department_id, 
          AVG(salary)
     FROM employees
  GROUP BY department_id
  HAVING max(salary)>10000;
  
 Aşağıdakı nümunədə ümumi əmək haqqı hesabı 13000 dollardan çox olan hər bir iş üçün job id və ümumi aylıq əmək haqqı göstərilir. 
 
  select job_id, 
         sum(salary) payroll
    from employees
   where job_id not like '%rep%'
 group by job_id
 having   sum(salary) > 13000
 order by sum(salary);
 
 Sorğu satış nümayəndələrini kənarlaşdırır və siyahıları ümumi aylıq əmək haqqına görə sıralayır.
 
 Nesting Group Functions
 
 select max(avg(salary))
   from   employees
 group by department_id;


select case
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '01' then 
           'Yanvar'
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '02' then 
           'Fevral'
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '03' then 
           'Mart' 
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '04' then 
           'Aprel'  
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '05' then 
           'May' 
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '06' then 
           'Iyun'  
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '07' then 
           'Iyul'
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '08' then 
           'Avgust'  
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '09' then 
           'Sentyabr'  
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '10' then 
           'Oktyabr'  
         when substr(to_char(hire_date,'mmyyyy'),1,2) = '11' then 
           'Noyabr' 
         else
           'Dekabr'
       end as month_name,
       to_char(hire_date,'mmyyyy'),
       count(*) as cnt,
       sum(salary) as sum_salary,
       round(avg(salary),2) as avg_saalry
  from employees
group by to_char(hire_date,'mmyyyy');

 
*/
  
