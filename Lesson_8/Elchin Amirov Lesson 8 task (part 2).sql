

-- 1. 
Products 
Name      Description   Date
Kredit    İstehlak      14.02.2024 
Account   Cari          15.02.2024
Depozit   2 illik       17.03.2024 
Kart      Debit         19.03.2024 


Transactions
TrId           TrDescription              Amount      TrDate
10000      Müqavilə kredit üzrə ödənişi    250      19.04.2024 14:17:25
10001      Cari hesaba mədaxil account     350      10.04.2024 19:05:36
10002      Depozit məbləğinin artırılması  500      20.04.2024 14:17:25

Products və Transactions cədvəllərini birləşdirin.


select p.name,
       p.description,
       p.date,
       t.trid,
       t.trdescription,
       t.amount,
       t.trdate
from products p
join transactions t
    on lower(t.trdescription) like '%' || LOWER(p.name) || '%';

-- 2. İşçilərin employee_id -si, adı, soyadı, işlədikləri departament(department_id) tabe olduqları manager -i(manager_id), tabe
--    olduqları menecerin adı, tabe olduqları menecerin soyadı,  tabe olduqları menecerin departamenti(department_id) haqqında 
--    məlumatları formalaşdıran sorğunu yazın. Bundan başqa menecerləri fərqli departamentdə işləyən məlumatlar ekrana əks 
--    olunmalıdır.
    select 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    m.employee_id,
    m.first_name,
    m.last_name,
    m.department_id
    from employees e
    inner join employees m
    on
    m.employee_id=e.manager_id
    WHERE e.department_id <> m.department_id;
-- 3. Aşağıdakı sorğu ilə eyni nəticəni qaytaran sorğunu yazın.
     
     select  employee_id, 
             e.first_name, 
             e.last_name, 
             jh.end_date
        from employees e natural
        join job_history jh;
   
        ---------------------------------------
        
        select employee_id, 
             e.first_name, 
             e.last_name, 
             jh.end_date from employees e
        join job_history jh
        using(employee_id,job_id,department_id);
        
 
    
        

-- 4. Aşağıdakı cədvəllərdən qeyd olunan məlumatları ekrana çıxartmaq tələb olunur. Müştəri nömrəsini, ad, soyad, ata adı, 
--şəxsiyyət vəsiqəsinin seriyası, şəxsiyyət vəsiqəsinin 
--    nömrəsi,  telefon nömrəsi(telefon nömrəsinin qarşısındakı ölkə kodunu yığışdıraraq ancaq nömrəni ekrana çıxardın), 
--etdiyi tranzaksiyanın məbləği, etdiyi tranzaksiyanın tarixi 
--    və iban  haqqında məlumatlar ekrana çıxmalıdır. Ancaq aktiv müştərilərin məlumatları əks olunmalıdır. 
--Bundan başqa müştərilərin bütün məlumatları ekranda əks olunmalıdır. 
--    Yəni hər hansı telefonu və tranzaksiya edib etməməsindən asılı olaraq.  

select 
    c.cust_no,
    c.name,c.surname,c.PATRONYMIC,
    c.DCM_SERIAL_NO,c.DCM_NO,
    substr(p.phone_number,5) as phone_number,
    t.amount,t.transaction_date,
    t.iban
from CUST_INFORMATION c
left join PHONE_NUMBER p
on p.dcm_serial_no_id=concat(c.DCM_SERIAL_NO,c.DCM_NO)
left join TRANSACTION t
on substr(t.iban,7,5)=to_char(c.cust_no)
where c.status='A';
       
      CUST_INFORMATION
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
  transaction_date -etdiyi tranzaksiyanın tarixi

-- 5. 
Müştərilər (Customers)

Id	Name
100	Famil
200	Eldar
300	Leyla

Kredit növləri (Loan_type)

Package_Id	loan_type_name
1	İstehlak Krediti
2	Mənzil Krediti
3	Avtomobil Krediti

Yuxarıdakı cədvəllərdən istifadə edərək hər bir müştərinin hansı kreditləri ala biləcəyini göstərmək üçün sorğu yazın.

    select *
    from customers
    cross join loan_type;
    
