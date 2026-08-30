/*
 Verilənlər bazasında müxtəlif məlumatları saxlayan birdən çox cədvəl var. Bəzən birdən çox cədvəlin məlumatlarından istifadə etmək lazım olur.
 Nə vaxt ki, məlumat bazasında birdən çox cədvəldən məlumatlar əldə etmək tələb olunursa birləşmə(join) şərtindən istifadə olunur. Bu dərsdə   
 birləşmənin(Join) müxtəlif növlərinə baxılır. Birdən çox cədvəldən məlumat sorğulamaq istəyirsinizsə birləşmədən(join) istifadə edin.Join -lərin 
 aşağıdakı tipləri var.
 
   Equijoins  
   Non-equijoins 
   INNER joins
   OUTER joins
   NATURAL joins
   Using clause
   Cross-joins
   Self-joins
   
 SQL-də bir neçə növ birləşmə mövcuddur. Equijoins(bərabərlik) birləşmə ən çox istifadə olunan birləşmə tipidir. Digər non-equijoin(bərabər 
 olmayan) birləşmədir. Hər iki birləşmə növü müzakirə olunacaq. Cədvəllərin birləşdirilməsi vaxtı bizə kömək olacaq bəzi anlayışları nəzərdən
 keçirək. PRIMARY KEY ve FOREIGN KEY constraint -nə baxaq.
 
 Birləşmənin(Join) tipləri
 Birləşmənin müəyyənləşdirilməsinin bir yolu daxili(inner) və ya xarici(outer) birləşmə(join) olub olmaması baxımındandır. Digər isə non-equijoin
 (bərabər olmayan) birləşmədir. Bu təsvirlər bir-birini inkar etmir. 
 
 Daxili(Inner) və xarici(Outer) birləşmələr     
 Oracle SQL-də birləşmə yaratmaq üçün iki əsas sintaksis kateqoriyası var:
   Equijoins(bərabərlik) iki və ya daha çox cədvəlin sütunları arasında ümumi(uyğun) məlumatları axtararaq bu cədvəlləri birləşdirir. Başqa sözlə
   equijoins(bərabərlik) dəqiq uyğun məlumatlara baxır.
   
   Non-equijoins birləşmə bərabər olmayan əlaqələri axtarır ">", "<" kimi və ya bir cədvəldəki məlumatların digər cədvəldəki məlumat aralılığında
   olan məlumatları birləşdirir. 
 Birləşmələrin əksəriyyəti, hansılarla ki, biz işləyəcəyik, Equijoins(bərabərlik) olacaqlar, amma biz həmçinin Non-equijoins baxacağıq .  
 
 Digər birləşmələr.
 Bu birləşməyə Cross join və Natural join daxildir.
 
 Birləşmələrin(Join) təyin edilməsi
 Nə vaxt ki, məlumat bazasında birdən çox cədvəldən məlumatlar əldə edilməsi tələb olunursa, birləşmə şərtindən istifadə olunur. Bir cədvəldəki 
 sətirləri digər cədvəldəki sətirlərə birləşdirmək üçün bu cədvəllərdəki ortaq(ümumi) sütundakı uyğun dəyərlərə görə(adətən primary key və foreign key)
 birləşdirmək lazımdı. 
 
 İki və ya daha çox əlaqəli cədvəldəki məlumatları göstərmək üçün, WHERE bəndində sadə birləşmə şərtini yazın. Birləşmə şərti WHERE hissəsində yazılır.
 
  Sintaksis: table1.column - məlumatların alındığı cədvəl və sütunu bildirir
             table1.column1 = table2.column2 - cədvəlləri bir-birinə birləşdirən (və ya əlaqələndirən) şərt
             
 Qaydalar
   
   • Cədvəlləri birləşdirən SELECT bəyanatının yazılışı vaxtı sütunun adından əvvəl aydınlıq üçün cədvəlin adını yazmaq lazımdır.
   
   • Əgər sütunun eyni adı bir neçə cədvəldə varsa, sütun adınan əvvəl cədvəl adını əlavə etmək lazımdı.
   
   • Əgər n sayda cədvəli birləşdirmək üçün minimum n - 1 sayda birləşdirmə şərti olmalıdır. Məsələn, dörd cədvəlin birləşməsi üçün minimum üç birləşmə şərti tələb olunur.
   
   
   select table1.column, 
          table2.column
     from table1, table2
    where table1.column1 = table2.column2;

 Equijoins
 
   Əməkdaşların işlədiyi departamentin adını təyin etmək üçün DEPARTMENTS cədvəlində DEPARTMENT_ID sütunun qiyməti EMPLOYEES cədvəlinin DEPARTMENT_ID sütunun qiyməti ilə 
   müqayisə olunur. EMPLOYEES və DEPARTMENTS cədvəlləri arasındakı əlaqə bərabərdir, yəni hər iki cədvəldəki DEPARTMENT_ID sütunundakı dəyərlər bərabər olmalıdır.    
   Qeyd: Bərabərlik üzrə(=) birləşmələr həmçinin sadə birləşmə(join) və ya daxili birləşmə(inner join) adlanır. 
   
   select employees.employee_id, 
          employees.last_name, 
          employees.department_id,
          departments.department_name
          departments.location_id
     from employees, departments
    where employees.department_id = departments.department_id;
   
   
 Bərabər birləşmələrlə sətirlərin alınması
 
   • SELECT -də əldə ediləcək sütunların adları qeyd edilir
   
     – Əməkdaşların soyadı(last_name), işçi nömrəsi(employee_id) və departament nömrəsi(department_id) EMPLOYEES cədvəlinin sütunlarıdı.      
     
     - Departament adı(department_name) və location_id sütunları isə DEPARTMENTS cədvəllərinin sütunlarıdır.
          
   • FROM bəndində verilənlər bazasına daxil olmalı olduğu iki cədvəl göstərilir:
    
     – EMPLOYEES cədvəli
     – DEPARTMENTS cədvəli
    
   • WHERE bəndində cədvəllərin necə birləşdiriləcəyi müəyyənləşdirilir
     
     - EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID

    DEPARTMENT_ID sütunu hər iki cədvəl üçün ümumi olduğundan, qeyri-müəyyənlik yaratmamaq üçün cədvəl adı ilə əvvəlcədən yazılmalıdır. 
    
 Əlavə axtarış şərtləri
  
  Birləşmə şərtindən başqa birləşmədə iştirak edən bir və ya bir neçə cədvəllərin sətirlərini məhdudlaşdırmaq üçün WHERE bəndində əlavə meyarlar ola bilər. Aşağıdakı sorğuda soyadı
  Matos olan əməkdaşın adı(last_name), departament nömrəsi(department_id), departamentin adı(department_name) məlumatları ekrana çıxarılır. 
  
    select last_name,  
           employees.department_id,
           department_name
      from employees, 
           departments
     where employees.department_id = departments.department_id
       and last_name = 'Matos';
       
  
  Qeyri müəyyənliyi aradan qaldırmaq üçün WHERE bəndindəki sütun adlarının əvvəlinə cədvəlin adını yazmaq lazımdı. department_id sütunun əvvəlində cədvəlin adı olmasa bu sütun
  EMPLOYEES və ya DEPARTMENTS cədvəlinə aid oluna bilər. Sorğunu yerinə yetirmək üçün cədvəlin adını sütunların əvvəlinə əlavə etmək lazımdır. İki cədvəl arasında ortaq sütun 
  adları yoxdursa, sütunların əvvəlinə cədvəl adını əlavə etməyə ehtiyac yoxdur. Bununla birlikdə, cədvəl adından istifadə performansı yaxşılaşdırır, çünki Oracle Server 
  sütunları hansı cədvəldə axtaracağını bilir. Sütun adının əvvəlində cədvəlin adını qeyd edilməsi təkcə SELECT və WHERE bəndindən başqa ORDER BY bəndində də qeyd edilməlidir.
  
  
  Cədvəl Alias(ləqəb, qoşma ad, uydurma ad) -ından istifadə   
  
  Cədvəl alias -lardan (ləqəblərindən) istifadə etməklə sorğuları sadələşdirin. Cədvəl alias -lardan(ləqəblərindən) istifadə etməklə performans artırılır.
  
     select e.employee_id, 
            e.last_name, 
            e.department_id,
            d.department_name, 
            d.location_id
       from employees e, departments d
      where e.department_id = d.department_id; 
  
  
  Cədvəlin adının alias kimi istifadə olunması cədvəlin adı uzun olduqda müəyyən vaxt itkisinə səbəb olur. Siz cədvəllərin adlarının yerinə cədvəllərin təxəllüslərindən (alias) 
  istifadə edə bilərsiniz. Cədvəllərin təxəllüsləri(alias) SQL kodunun ölçüsünü azaltmağa kömək edir, buna görə daha az yaddaşdan istifadə edirlər. Misalda FROM bəndində cədvəl 
  təxəllüslərinin (alias) necə təyin olunduğuna diqqət yetirin. Cədvəlin adı tam olaraq göstərilib, ardından boşluq və sonra cədvəlin təxəllüsü (alias) yazılıb. EMPLOYEES cədvəlinə 
  e, DEPARTMENTS cədvəlinə d təxəllüsü (alias) verilmişdir.
  
  Qaydalar
    • Oracle əvvəlki versiyalarında cədvəl təxəllüsü (alias) 30 simvola(byte) qədər ola bilərdi. Ancaq Oracle 12 versiyasında 128 byte -a (128 simvola) qədər artırılıb. 
      Amma təxəllüs (alias) nə qədər qısa olsa, daha yaxşıdır. 
      
    • Əgər cədvəlin təxəllüsü FROM təklifində cədvəl adı üçün istifadə olunursa, cədvəlin bu təxəllüsü SELECT hissəsində olan həmin cədvəlin sütunlarına da əlavə edilməlidir.
    
    • Cədvəllərin təxəllüsləri mənalı olmalıdır.  
  
    • Cədvəl təxəllüsləri yalnız cari SELECT bəyanatı üçün etibarlıdır.
    
  n sayda cədvəli birləşdirmək ən azı n- 1 sayda birləşmə şərti lazımdı. Bəzən ikidən çox cədvəli birləşdirmək lazım olur. Aşağıdakı nümunədə hər bir əməkdaşın soyadı, departament 
  adı, şəhər adı haqqında məlumatları əldə etmək üçün EMPLOYEES, DEPARTMENTS və LOCATIONS cədvəllərini birləşdirmək lazımdı.
  
    select e.last_name, 
           d.department_name, l.city
      from employees e, 
           departments d, 
           locations l
     where e.department_id = d.department_id
       and d.location_id = l.location_id; 

  
  Nonequijoins
  
  Cədvəllərin Nonequijoins birləşmədə "=" (bərabərlik) operatorundan başqa digər operatorlardan istifadə olunur. Digər operatorlar dedikdə "<>", "<", ">", "<=", ">=", LIKE, IN, 
  və BETWEEN nəzərdə tutulur. Bu birləşmədən nadir hallarda istifadə olunur və əasasən "BETWEEN" operatorundan istifadə olunur.
  
    select e.last_name, 
           e.salary, 
           j.grade
      from employees e, 
           job_grades j
     where e.salary between j.lowest_sal and j.highest_sal;  

  Yuxarıdakı nümunə işçinin əmək haqqı dərəcəsini qiymətləndirmək üçün Nonequijoins birləşmədən istifadə olunub. Əmək haqqı aşağı və yuxarı əmək haqqı diapazonlarının istənilən 
  cütünün arasında olmalıdır. Sorğu yerinə yetirilən zaman bütün əməkdaşların bir dəfə göründüyünə(təkrarlanmadığına) diqqət edin. Siyahıda heç bir əməkdaş təkrarlanmır. 
  Bunun iki səbəbi var:
  
   • Job_grades cədvəlindəki sətirlərin heç birində üst-üstə düşən qiymətlər yoxdur. Yəni əməkdaşın əmək haqqı dəyəri əmək haqqı dərəcələri cədvəlindəki sətirlərdən birinin aşağı və
     yuxarı əmək haqqı dəyərləri arasında ola bilər. 
     
   • Bütün işçilərin əmək haqları iş dərəcələri(job_grades) cədvəlində təyin edilən sərhədlər daxilindədir. Yəni, heç bir işçi LOWEST_SAL sütunundakı ən aşağı qiymətdən az və ya 
     HIGHEST_SAL sütunundakı ən yüksək dəyərdən çox qazana bilməz. 
     
  Qeyd: Digər şərtlər, məsələn, <= və> = istifadə edilə bilər, lakin BETWEEN ən sadədir. BETWEEN istifadə edərkən əvvəlcə aşağı dəyəri və yüksək dəyəri isə sonda göstərməyi unutmayın.   
  
  
  Xarici birləşmələr(Outer Joins) 
  Əgər sətir birləşmə şərtinə ödəmirsə(təmin etmirsə), sətir sorğu nəticəsində əks olunmayacaq. Məsələn, EMPLOYEES və DEPARTMENTS cədvəllərinin bərabərlik üzrə birləşmə şərtində
  (equijoin condition) Grant əməkdaşı əks olunmur, çünki onun üçün EMPLOYEES cədvəlində departament nömrəsi göstərilməmişdir.
  
    select e.last_name, 
           e.department_id, 
           d.department_name
      from employees e, departments d
     where e.department_id = d.department_id;
     
  Xarici birləşmələrin sintaksisi(Outer Joins Syntax)   
  
   • Birləşmə şərtinə uyğun olmayan sətirləri görmək üçün xarici birləşmədən(Outer Join) istifadə olunur.
   
   • Xarici birləşmə (Outer Join) operatoru toplama işarəsidir (+).
   
   
      select table1.column, 
             table2.column
        from table1, 
             table2
       where table1.column(+) = table2.column;
       
       
       select table1.column, 
              table2.column
         from table1, 
              table2
        where table1.column = table2.column(+);

  Birləşdirmə şərtində(join condition) xarici birləşmə(Outer Join) operatorundan istifadə edilirsə çatışmayan sətirlər geri qaytarılır. Operator mörtərizə içərisinə salınmış toplama
  (+) simvoludu və birləşmə şərtində məlumat çatışmayan tərəfdə yerləşdirilir. Bu operator cədvəllərin birləşdirilməsi vaxtı məlumat olmayan cədvəldən bir və ya daha çox null sətir 
  yaradaraq geri qaytarır.
  
  Sintaksisdə:
  
    table1.column =   cədvəlləri bir-birinə birləşdirən (və ya əlaqələndirən) şərtdir.
    table2.column (+) xarici birləşmə simvoludur, hansı ki, WHERE bəndində olan şərtin istənilən tərəfində yerləşdirmək olar, ancaq hər iki tərəfdə eyni anda yerləçdirilə bilməz.
                      Sonra xarici birləşmənin simvolunu sətirlər çatışmayan cədvəlin sütununun adının qarşısında yerləşdirin. 
                      
  select e.last_name, 
         e.department_id, 
         d.department_name
    from employees e, departments d
   where e.department_id(+) = d.department_id;
   
 Yuxarıdakı nümunədə əməkdaşların soyadı, departament nömrəsi və departamentin adını ekrana çıxardır. Bu sorğuya diqqət yetirsək xarici birləşmə simvolu(+) employees cədvəlinin  
 departament_id sütununun qarşısına yazılıb. Sorğunun nəticəsinə baxsaq görərik ki employes cədvəlin olmayan sətirlər NULL olaraq əks olunur. Yəni xarici birləşmə vasitəsilə 
 DEPARTMENTS cədvəlində olan EMPLOYEES cədvəlində olmayan sətirlər NULL olaraq əks olunur.
 
 Xarici Birləşmə Məhdudiyyətləri
 
  • Xarici birləşmə operatoru ifadənin yalnız bir tərəfində qeyd edilə bilər: məlumat olmayan tərəf. O bir cədvəldən o sətirləri qaytarır, hansılar ki, başqa cədvəldə birləşmə 
    şərtinə uyğun deyil   
  
  • Xarici birləşməni özündə saxlayan şərt IN operatoru istifadə edilə bilməz və ya OR operatoru tərəfindən başqa bir şərtdə bağlana bilməz
  
 Öz özünə birləşdirmə(Self Joins)
 Cədvəlin özü özünə birləşdirilməsi.    
 Bəzən cədvəlin özü özünə birləşdirilməsinə ehtiyac duyulur. Hər bir əməkdaşın menecerinin adını bilmək üçün, EMPLOYEES cədvəlinini öz özünə birləşdirmək və ya öz özünə birləşməni 
 yerinə yetirmək lazımdır. Məsələn, Whalen menecerinin adını tapmaq üçün aşağıdakıları etməlisiniz: 
 
  • LAST_NAME sütununa baxaraq EMPLOYEES cədvəlində Whalen -i tapın.  
  
  • MANAGER_ID sütununa baxıb Whalen üçün menecerin nömrəsini tapın.
  
  • Whalen menecerinin nömrəsi 101-dir.
  
  • Menecerin adını EMPLOYEE_ID -si 101 olan sətirdə LAST_NAME sütununa baxaraq bilmək olar. EMPLOYEE_ID -si 101 olan sətirdə ad(LAST_NAME) Kochhar -dı. Deməli Whalen -nin meneceri 
    Kochhar -dı.
  
  Bu prosesdə siz cədvələ iki dəfə baxırsınız. İlk dəfə LAST_NAME sütununda Whalen -i və MANAGER_ID sütununun 101 dəyərini əldə etmək üçün axtarış edilir. İkinci dəfəyə siz 
  EMPLOYEE_ID sütununda baxırsınız, 101 tapmaq üçün, və LAST_NAME sütununda, Kochhar -ı tapmaq üçün.
  
   select worker.employee_id,
          worker.first_name,
          worker.last_name,
          worker.manager_id,
          manager.first_name manager_name,
          manager.last_name manager_last_name
    from employees worker, 
         employees manager
   where worker.manager_id = manager.employee_id
     and worker.manager_id = 100;
 
  Yuxarıdakı nümunə EMPLOYEES cədvəli özü özünə birləşdirilir. FROM bəndində iki cədvəl modelini hazırlamaq üçün iki alias var w və m eyni EMPLOYEES cədvəli üçün. Bu misalda, WHERE 
  bəndində "işçinin menecer nömrəsi menecer üçün işçi nömrəsinə uyğun olduğu" mənasını verir.
  
  
  SQL 1999 Sintaksisindən istifadə edərək cədvəllərin birləşdirilməsi.
  Birdən çox cədvəldən məlumatların sorğusu üçün birləşmədən istifadə edin.   
  
    SELECT table1.column, 
           table2.column
      FROM table1
    [CROSS JOIN table2] |
    [NATURAL JOIN table2] |
    [JOIN table2 USING (column_name)] |
    [JOIN table2
    ON(table1.column_name = table2.column_name)] |
    [LEFT|RIGHT|FULL OUTER JOIN table2
    ON (table1.column_name = table2.column_name)]
   
  Birləşmələrin təyini 
  SQL 1999 sintaksisindən istifadə edərək yuxarıda istifadə etdiyimiz cədvəllərin birləşdirilməsi ilə eyni nəticələr əldə edə bilərik.
  
  Sintaksisdə:
  
  table1.column     
  CROSS JOIN      
  NATURAL JOIN      
  JOIN table
  USING column_name 
  JOIN table ON
  table1.column_name  
  = table2.column_name
  LEFT/RIGHT/FULL OUTER


 Kross-birləşmələrin yaradılması(Creating Cross Joins) 
 CROSS JOIN, ilk cədvəldəki bütün sətirlərin ikinci cədvəldəki bütün sətirlər ilə birləşdiyini göstərir. Cədvəl1-də n sayda sətir və cədvəl2-də m sayda sətir varsa, CROSS JOIN 
 birləşmənin nəticəsi n * m sayda sətirləri qaytarır. Adətən heç bir uyğun birləşmə sütunu göstərilmədikdə olur. Sadə sözlə deyə bilərik ki, əgər iki cədvəlin birləşdirilməsi vaxtı
 birləşmə şərti yoxdursa, Oracle onların CROSS JOIN nəticəsini qaytarır.
 
 Natural Join
  • NATURAL JOIN bəndi eyni ada malik olan iki cədvəldə bütün sütunlara əsaslanır.
  
  • O iki cədvəldən sətirləri seçir, hansılar ki, bütün müqayisə edilən sütunlarda eyni qiymətlərə malikdirlər.
  
  • Eyni adları olan sütunlarda fərqli məlumat tipləri varsa, bir səhv geri qaytarılır.
  
 Oracle Server-in əvvəlki buraxılışlarında müvafiq cədvəllərdəki sütunları dəqiq göstərmədən birləşməni yerinə yetirmək mümkün deyildi. NATURAL JOIN açar sözlərindən istifadə edərək
 uyğun məlumat tipləri və eyni adları olan iki cədvəldəki sütunlar əsasında birləşmənin avtomatik yerinə yetirmək mümkündür. 
 
 Qeyd: Birləşmə yalnız hər iki cədvəldə eyni adlar və eyni məlumat tipləri olan sütunlarda baş verə bilər. Əgər sütunlar eyni ada malikdirsə ancaq fərqli məlumat tiplərinə sahibdirlərsə 
 NATURAL JOIN sintaksis səhvi verir. 
 
   select department_id, 
          department_name,
          location_id, 
          city
     from departments
   natural join locations;

 LOCATIONS cədvəli DEPARTMENTS cədvəlinə hər iki cədvəldə eyni ada sahib tək sütun olan LOCATION_ID sütunu vasitəsilə birləşdirilir. Digər ümumi sütunlar olsaydı, birləşmə hamısından
 istifadə edərdi.    
 
 NATURAL JOIN eyni zamanda bərabərlik üzrə birləşmə (equijoin) şəklində də yazıla bilər:
 
 select department_id, 
        department_name,
        departments.location_id, city
   from departments, locations
  where departments.location_id = locations.location_id;
  
  
 NATURAL JOIN WHERE bəndi ilə
 NATURAL JOIN üçün əlavə məhdudiyyətlər WHERE təklifinin köməyi ilə reallaşdırılır. Aşağıdakı nümunədə departament_id -si 20 və 50 olan əməkdaşların məlumatları ekrana çıxardılır.
  
  select department_id, 
         department_name, 
         location_id, 
         city
    from departments natural
    join locations
   where department_id in (20, 50);
   
  NATURAL JOIN -də hər iki cədvəl üçün ortaq olan sütunlar üçün alias istifadə edilə bilməz. Aşağıdakı nümunədə DEPARTMENTS və LOCATIONS cədvəlləri üçün ortaq olan LOCATION_ID
  sütununun qarşısında alias yazılmışdır. Bu sorğunu yerinə yetirmək istəsək səhv baş verəcək.
     
      select d.department_id, 
             d.department_name, 
             l.location_id, 
             l.city
        from departments d natural join 
             locations l;
             
      select d.department_id, 
             d.department_name, 
             location_id, 
             l.city
        from departments d natural join 
             locations l  
       where l.location_id = 1500;      
             
  USING bəndinin köməyi ilə birləşmələrin yaradılması  
  
   • Bir neçə sütunun eyni adları var, lakin məlumat tipləri uyğun gəlmirsə, bərabər birləşmə(equijoin) üçün istifadə edilməli sütunları təyin etmək üçün NATURAL JOIN əvəzinə USING 
     -dən istifadə edilə bilər.         
     Qeyd: Birdən çox sütun uyğun gəldikdə yalnız bir sütuna uyğunlaşmaq üçün USING bəndini istifadə edin
     
   • Ortaq olan sütunlar üçün alias və cədvəl adından istifadə edilə bilməz 
   
   • NATURAL JOIN və USING təklifləri bir-birinə ziddir
   
 USING -dən istifadə 
 NATURAL JOIN cədvəlləri birləşdirmək üçün eyni adlar və eyni məlumat tipləri olan bütün sütunlardan istifadə edir. USING bəndindən yalnız bərabərlik(equijoin) üçün istifadə edilməli 
 olan sütunları təyin etmək üçün istifadə edilə bilər. USING -də istifadə olunan sütunlar SQL operatorunda alias və cədvəl adından istifadə edilə bilməz.
 
  Məsələn, bu ifadələr etibarlıdır:
  
  select l.city, 
         d.department_name
    from locations l join departments d 
    using (location_id)
  
  select l.city, 
         d.department_name
    from locations l join departments d 
    using (location_id)
    where location_id = 1400;
    
  Aşağıdakı sorğuları icra etsək səhv baş verəcək
  
  select l.city, 
         d.department_name
    from locations l join departments d using(location_id)
   where d.location_id = 1400; 
   
  select l.city, 
         d.department_name,
         d.location_id
    from locations l join departments d using(location_id)
   where location_id = 1400; 
   
  Çünkü USING bəndində istifadə olunan location_id sütununun qarşısında aliasdan istifadə olunub. Buna görə hər iki cədvəldə eyni adı olan sütunlar hər hansı bir alias və cədvəl adı
  olmadan istifadə edilməlidir.   
  
  USING -in köməyi ilə sətirlərin ekrana çıxardılması  
  
   select e.employee_id, 
          e.last_name, 
          d.location_id
     from employees e join departments d
    using (department_id);
    
  Göstərilmiş nümunə EMPLOYEES və DEPARTMENTS cədvəllərində DEPARTMENT_ID sütununu vasitəsilə birləşdirilir və əməkdaşın işlədiyi yeri göstərir.
  Bu sorğu həmçinin bərabərlik üzrə birləşmə(equijoin) kimi yazıla bilər:  
  
   select employee_id, 
          last_name, 
          employees.department_id, location_id
    from  employees, 
          departments
   where employees.department_id = departments.department_id;
 
  ON təklifinin köməyi ilə birləşmələrin yaradılması
  
  • NATURAL JOIN üçün birləşmə şərti əsasən eyni adlı bütün sütunların bərabərlik üzrə birləşməsidir(equijoin) 
  
  • İstəyə bağlı olaraq şərtləri müəyyən etmək üçün və ya birləşdiriləcək sütunları müəyyən etmək üçün ON bəndindən istifadə olunur  
 
  • Birləşmə şərtini digər axtarış şərtlərindən ayırır    
   
  ON maddəsi kodu başa düşməyi asanlaşdırır. Birləşmə şərtini göstərmək üçün ON təklifindən istifadə edin. Bu sizə WHERE bəndində axtarış və ya filtrasiya şərtlərindən ayrı birləşmə
  şərtlərini göstərməyə icazə verir.
  
      select e.employee_id, 
             e.last_name, 
             e.department_id, 
             d.department_id, 
             d.location_id
        from employees e join departments d
          on (e.department_id = d.department_id);
          
  Fərqli adları olan sütunlara qoşulmaq üçün ON maddəsi də aşağıdakı kimi istifadə edilə bilər:
  
     select e.last_name emp, 
            m.last_name mgr
       from employees e join employees m
         on (e.manager_id = m.employee_id);
         
  Yuxarıdakı nümunə, EMPLOYEE_ID və MANAGER_ID sütunlarına əsaslanan EMPLOYEE cədvəlinin özünə(SELF JOIN) birləşdirilməsidir. 
  
  ON maddəsi ilə üç tərəfli birləşmə yaratmaq     
  
   select employee_id, 
          city, 
          department_name
     from employees e 
     join departments d
       on d.department_id = e.department_id 
     join locations l
       on d.location_id = l.location_id;

  
  Üçtərəfli birləşmələr(Three-Way Joins) 
  Üçtərəfli birləşmə üç cədvəlin birləşməsidir. SQL 1999-a uyğun sintaksisdə birləşmələr soldan sağa, buna görə birinci yerinə yetirilən birləşmə(JOIN) EMPLOYEES VƏ DEPARTMENTS 
  cədvəlləri arasında başverir. Birləşmənin birinci şərti EMPLOYEES və DEPARTMENTS cədvəllərindəki sütunlara istinad edə bilər amma LOCATIONS-dakı sütunlara istinad edə bilməz.
  İkinci qoşulma şərti hər üç cədvəldən sütunlara istinad edə bilər. Bu sorğunu həmçinin bərabərlik üzrə birləşmə (equijoin) kimi yazmaq olar: 
  
    select employee_id, 
           city, 
           department_name
      from employees, 
           departments, 
           locations
     where employees.department_id = departments.department_id
       and departments.location_id = locations.location_id;
       
        
  INNER və OUTER birləşmələr(Joins)
   
    • SQL 1999-da yalnız uyğun gələn sətirləri qaytaran iki cədvəlin birləşməsi daxili birləşmədir(INNER JOIN) 
  
    • Daxili birləşmə (INNER JOIN) vasitəsilə iki cədvəl arasında uyğun məlumatları qaytarır, uyğun olmayan sətirləri əldə etmək üçün xarici birləşmədən(outer join) istifadə olunur
    
    • İki cədvəlin arasında birləşmə, hansı ki, daxili birləşmənin(inner join) nəticələrini qaytarır, həmçinin sol(left) və sağ (right) birləşmənin nəticələri, tam xarici birləşmə
     (full outer join) adlanır.
     
          _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _     
         |                 |                         |
         | Oracle          | SQL 1999                |  
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _| 
         |                 |                         | 
         | Equijoin        | Natural or Inner Join   | 
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _|  
         |                 |                         | 
         | Outerjoin       | Left Outer Join         |  
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _|
         |                 |                         |
         | Selfjoin        | Join ON                 |
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _|
         |                 |                         |
         | Nonequijoin     | Join USING              | 
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _|
         |                 |                         |
         |Cartesian Produc | Cross Join              |
         |_ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _|


   LEFT OUTER JOIN
   
    select e.last_name, 
           e.department_id, 
           d.department_name
      from employees e
      left outer join departments d
        on (e.department_id = d.department_id);
    
  Bu sorğu EMPLOYEES cədvəlindəki bütün sətirləri çıxarır hansı ki sol(left) cədvəldir bundan başqa DEPARTMENTS cədvəlində birləşmə şərtinə uyğun olmayan sətirləri null olaraq 
  çıxardır. Yuxarıdakı sorğunu aşağıdakı şəkildə yazmaq olar.
  
    select e.last_name, 
           e.department_id, 
           d.department_name
      from employees e, departments d
     where d.department_id (+) = e.department_id;  
     
  RIGHT OUTER JOIN
  
    select e.last_name, e.department_id, d.department_name
      from employees e
     right outer join departments d
        on (e.department_id = d.department_id);
        
  Bu sorğu DEPARTMENTS cədvəlində bütün sətirləri çıxardır hansı ki, sağ cədvəldir, hətta əgər EMPLOYEES cədvəlində birləşmə şərtinə uyğun olmayan sətirləri null olaraq çıxardır. 
  Yuxarıdakı sorğunu aşağıdakı şəkildə yazmaq olar.
  
    select e.last_name,  
           e.department_id, 
           d.department_name
      from employees e, departments d
     where d.department_id = e.department_id(+); 
     
  FULL OUTER JOIN
  
    select e.last_name, 
           e.department_id, 
           d.department_name
      from employees e
      full outer join departments d
        on (e.department_id = d.department_id);
        
  Bu sorğu EMPLOYEES cədvəlində bütün sətirləri çıxardır, hətta əgər DEPARTMENTS cədvəlində birləşmə şərtinə uyğun olmayan sətirlər olsa belə. O həmçinin DEPARTMENTS cədvəlində bütün
  sətirləri çıxardır, hətta əgər EMPLOYEES birləşmə şərtinə uyğun olmayan sətirlər olsa belə.    
  
  Əlavə şərtlər(Additional Conditions)   
  
    select e.employee_id,
           e.last_name,
           e.department_id,
           d.department_id,
           d.location_id
      from employees e
      join departments d
        on (e.department_id = d.department_id)
       and e.manager_id = 149;
  
   Əlavə şərtlərin tətbiqi
   Əlavə şərtləri WHERE bəndində tətbiq edə bilərsiniz. Göstərilən nümunədə EMPLOYEES və DEPARTMENTS cədvəllərinin birləşməsi yerinə yetirilir və bundan başqa, yalnız menecerin ID-si 
   149 - a bərabər olan əməkdaşlar əks olunurlar. Daxili birləşmə(Inner Join) zamanı əlavə şərtləri WHERE bəndində və ya ON birləşmə şərtlərinin qeyd edildiyi bəndə yazdıqda eyni 
   nəticəni qaytarır. Aşağıdakı hər iki sorğu eyni nəticəni qaytarır.
   
     select e.employee_id,
           e.last_name,
           e.department_id,
           d.department_id,
           d.location_id
      from employees e
      join departments d
        on (e.department_id = d.department_id)
       and e.manager_id = 149;

     select e.employee_id,
           e.last_name,
           e.department_id,
           d.department_id,
           d.location_id
      from employees e
      join departments d
        on (e.department_id = d.department_id)
     where e.manager_id = 149;  

  Əlavə şərtləri LEFT JOIN üçün tətbiq edək.
  
    select e.employee_id,
           e.last_name,
           e.department_id,
           d.department_id,
           d.location_id
      from employees e
      left join departments d
        on (e.department_id = d.department_id)
     where e.department_id = 90;
   
 İndi yuxarıdakı sorğuda şərti WHERE bəndindən LEFT JOIN -nin ON bəndinə yerini dəyişsək görərik ki sorğunun nəticəsi fərqli olacaq.   
 
   select e.employee_id,
           e.last_name,
           e.department_id,
           d.department_id,
           d.location_id
      from employees e
      left join departments d
        on (e.department_id = d.department_id)
       and e.department_id = 90; 
       
 Bu halda sorğu EMPLOYEES cədvəlinin bütün sətirlərini geri qaytarır ancaq 90 nömrəli departamentin məlumatları əks olunur. LEFT JOIN -də əlavə şərti WHERE bəndində yazdıqda sorğu
 daxili birləşməyə (Inner Join) çevrilir.            
  
*/


 
