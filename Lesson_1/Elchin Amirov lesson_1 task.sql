-- 1.Əməkdaşların adını, soyadını, telefon nömrəsini, işə qəbul tarixini və əmək haqqı məlumatlarını ekrana çıxardan 
--   sorğunu yazın. Ad və soyad haqqında məlumatları aralarında bir boşluq olmaqla birləşdirməklə ekrana çıxardılsan. 
    
     select first_name ||' '|| last_name 
     as full_name,
     phone_number,
     hire_date,
     salary
     from employees;

-- 2.Əməkdaşların adı, soyadı, işlədiyi vəzifəsini, tabe olduğu menecer və işlədiyi departament məlumatlarını 
--   birləşdirərək(concat) ekrana çıxardan sorğu yazın. 

select first_name ||' '|| 
last_name ||' '|| 
job_Id ||' '|| 
manager_Id ||' '|| 
department_Id
from employees;

-- 3.Əməkdaşların işlədiyi vəzifə, tabe olduğu şəxs(menecer) və işlədiyi departamentlər üzrə təkrarlanmayan məlumatları 
--   ekrana çıxardan sorğunu yazın. 

select distinct job_id, 
manager_id, 
department_id 
from employees;

-- 4.Aşağıdakı products cədvəldən price və count sütunlarına əsasən ümumi məbləği hesablayan sorğunu yazın. 
        Products
        Product_ID  Price   Count
            1	     12	      4
            2	     5	      7
            3	     3	      25
            4	     10	      4
            5	     12	      3
            6	     8	      4
 select price*count from products;          
        

-- 5. PROMOTIONS cədvəlinin strukturu aşağıda göstərilmişdir(Describe). 
        Name	        Null	     Type
        promo_id	    not null    number(6)
        promo_name	    not null    varchar2(30)
        promo_category	not null    varchar2(30)
        promo_cost 	    not null    number(10,2)
        
     Aşağıdakı sorğulardan hansılar promo_cost və promo_category üzrə təkrarlanmayan məlumatları ekrana çıxardır. 
     
     (C)	SELECT DISTINCT promo_category, promo_cost FROM promotions;
    
-- 6. Cədvəldə hər bir avtomobil modeli üzrə satış sayı və cəmi satış məbləği qeyd olunmuşdur. İD, Brand, Price 
--     məlumatları əldə etmək üçün müvafiq sorğu yazın. Price olaraq Total_Amount sütununun Sell_Count sütununa 
--     nisbəti nəzərdə tutulur.   
      Cars
      ID  Brand       Model  Sell_Count  Total_Amount
      1   Toyota      Prado      2          160000
      2   Mitsubishi  Pajero     3          180000
      3   Hyundai     Elantra    6          240000

select Id, Brand, total_amount/sell_count as Price from Cars;

select salary* commission_pct from employees;
