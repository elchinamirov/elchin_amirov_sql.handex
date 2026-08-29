*********************************************HƏR BİRİNİZƏ UĞURLAR******************************


--1)Ən son işə qəbul olan 5 işçi haqqında məlumatları göstərən sorğu yazın.
select e.* 
from employees e
order by hire_date desc
fetch first 5 rows only;

--2) Məlumatında iki dəfə dəyişiklik olan əməkdaşların məlumatlarını ekrana çıxardan sorğu yazın.(Cədvəl job_history)

select employee_id 
from job_history 
group by employee_id
having count(*)=2;

--3) employees cədvəlindəki işçilərin iş stajına görə qruplarını müəyyən edən və hər bir qrupda neçə işçinin olduğunu təyin edən sorğunu yazın.
     iş stajına görə məlumtları üç qrupa ayırmaq lazımdı və aşağıda qeyd olunub.
     10 il daxil olmaqla ondan az stajı olanlar '<10'
     10 - 15 il stajı olanlar  '10-15'
     15 ildən artıq stajı olanlar '15+'


select 
case when extract(year from sysdate)-extract(year from hire_date)<=10 then '<10'
     when extract(year from sysdate)-extract(year from hire_date) between 11 and 15 then '10-15'
     when extract(year from sysdate)-extract(year from hire_date)>15 then '15+'
     end as category,
     count(employee_id)
     from employees
group by (case when extract(year from sysdate)-extract(year from hire_date)<=10 then '<10'
     when extract(year from sysdate)-extract(year from hire_date) between 11 and 15 then '10-15'
     when extract(year from sysdate)-extract(year from hire_date)>15 then '15+'
     end); 

--4) Son 25 ildə ən çox işçi götürülmüş Top3 deparametin nömrəsini və işçi sayını göstərən sorğu yazın

    select department_id,
    count(employee_id) as isci_sayi
    from employees
    where extract(year from sysdate)-extract(year from hire_date)<25
    group by department_id
    order by count(employee_id) desc
    fetch first 3 rows only;

--5. Orders
     OrderId - hər sətir üçün unikal dəyərləri saxlayır
     CustomerId - müştərinin unikal identifikatoru
     OrderDate - Sifariş tarixi
     OrderAmount - Sifariş məbləği 

     Yuxarıdakı Orders cədvəlinə əsasən hər bir müştərinin ümumi məbləğini və 
     sifarişlərinin orta məbləğini və sifarişlərinin sayını əldə edən sorğunu yazın. 


    select 
    CustomerId,
    sum(OrderAmount),
    avg(OrderAmount),
    count(OrderId)
    from orders
    group by CustomerId;
    
--6. Aşağıdakı kimi X cədvəli verilib.
İd      NAME
1         A
2         B
3         A
4         C
5       NULL
6         B
7         a
8         B
9       NULL
10        b

SELECT COUNT(*), COUNT(NAME), COUNT(DISTINCT NAME) FROM X;
Sorğusunun cavabı nədir?

count *=10, count(name)=8, count(distinct name)=5

--7. Aşağıdakı strukturda cədvəl və məlumatlara əsasən hər müştərinin hər ay üçün trakzaksiyaların sayını və tranzaksiya 
--   məbləğini hesablayan SQL sorğusu yazın.
Transactions
TrId      CustomerId      TrAmount     TrDate
1           10000           150      10.01.2024    
2           10001           50       12.01.2024 
3           10000           250      21.01.2024
4           10001           500      25.02.2024 
6           10001           600      27.02.2024
7           10000           450      03.04.2024
8           10000           635      06.04.2024 
9           10000           698      25.03.2024

select CustomerId,
extract(month from TrDate),
count(TrId),
sum(TrAmount)
from Transactions
group by CustomerId,extract(month from TrDate);
