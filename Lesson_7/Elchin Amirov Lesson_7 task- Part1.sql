-- 1. 
A 
ŞƏHƏR    RAYON 
Bakı     Xətayi
Sumqayıt 11 Mikra Rayon 
Bakı     Yasamal
Bakı     Suraxanı
Gəncə    Nizami
Sumqayıt 12 Mikra Rayon
Gəncə    Kəpəz
Sumqayıt 13 Mikra Rayon 
Xaçmaz   Xudat


B 
ŞƏHƏR     QƏSƏBƏ 
Bakı       Bakıxanov 
Sumqayıt   Hacı Zeynalabdin Tağıyev 
Sumqayıt   Corat
Bakı       Ələt 
Sumqayıt   Saray
Bakı       Müşfiq
Bakı       Zabrat
Gəncə      Gülüstan
Gəncə      Yeni Gəncə
Gəncə      Bağban
Minqəçevir Nur

--Yuxarıdakı A və B cədvəllərini birləşdirdikdə(ortaq sütun ŞƏHƏR sütunu olacaq) hansı məlumatlar(sətirlər) ekranda çıxmalıdırsa 
--həmin məlumatları yazın. Sorğu yazılmamalıdır.


--Select yazmayın sadəcə joinlərdən qayıdan nəticələri yazın.
Inner Join 
ŞƏHƏR    RAYON     QƏSƏBƏ

Bakı     Xətayi         Bakıxanov
Baki     Xətayi         Ələt
Baki     Xətayi         Müşfiq
Baki     Xətayi         Zabrat
Baki     Yasamal        Bakıxanov
Baki     Yasamal        Ələt
Baki     Yasamal        Müşfiq
Baki     Yasamal        Zabrat
Baki     Suraxanı       Bakıxanov
Baki     Suraxanı       Ələt
Baki     Suraxanı       Müşfiq
Baki     Suraxanı       Zabrat

Sumqayıt    11 mkr      Hz Tagiyev
Sumqayıt    11 mkr      Corat
Sumqayıt    11 mkr      Saray
Sumqayıt    12 mkr      Hz Tagiyev
Sumqayıt    12 mkr      Corat
Sumqayıt    12 mkr      Saray
Sumqayıt    13 mkr      Hz Tagiyev
Sumqayıt    13 mkr      Corat
Sumqayıt    13 mkr      Saray

Gəncə    Nizami     gulustan
Gəncə    Nizami     Yeni Gəncə
Gəncə    Nizami     Bağban
Gəncə    Kəpəz      gulustan
Gəncə    Kəpəz      Yeni Gəncə
Gəncə    Kəpəz      Bağban


Left Join 
ŞƏHƏR    RAYON   QƏSƏBƏ

Bakı     Xətayi         Bakıxanov
Baki     Xətayi         Ələt
Baki     Xətayi         Müşfiq
Baki     Xətayi         Zabrat
Baki     Yasamal        Bakıxanov
Baki     Yasamal        Ələt
Baki     Yasamal        Müşfiq
Baki     Yasamal        Zabrat
Baki     Suraxanı       Bakıxanov
Baki     Suraxanı       Ələt
Baki     Suraxanı       Müşfiq
Baki     Suraxanı       Zabrat

Sumqayıt    11 mkr      Hz Tagiyev
Sumqayıt    11 mkr      Corat
Sumqayıt    11 mkr      Saray
Sumqayıt    12 mkr      Hz Tagiyev
Sumqayıt    12 mkr      Corat
Sumqayıt    12 mkr      Saray
Sumqayıt    13 mkr      Hz Tagiyev
Sumqayıt    13 mkr      Corat
Sumqayıt    13 mkr      Saray

Gəncə    Nizami     gulustan
Gəncə    Nizami     Yeni Gəncə
Gəncə    Nizami     Bağban
Gəncə    Kəpəz      gulustan
Gəncə    Kəpəz      Yeni Gəncə
Gəncə    Kəpəz      Bağban

Xaçmaz   Xudat      Null

Right Join 
ŞƏHƏR    RAYON   QƏSƏBƏ

Bakı     Xətayi         Bakıxanov
Baki     Xətayi         Ələt
Baki     Xətayi         Müşfiq
Baki     Xətayi         Zabrat
Baki     Yasamal        Bakıxanov
Baki     Yasamal        Ələt
Baki     Yasamal        Müşfiq
Baki     Yasamal        Zabrat
Baki     Suraxanı       Bakıxanov
Baki     Suraxanı       Ələt
Baki     Suraxanı       Müşfiq
Baki     Suraxanı       Zabrat

Sumqayıt    11 mkr      Hz Tagiyev
Sumqayıt    11 mkr      Corat
Sumqayıt    11 mkr      Saray
Sumqayıt    12 mkr      Hz Tagiyev
Sumqayıt    12 mkr      Corat
Sumqayıt    12 mkr      Saray
Sumqayıt    13 mkr      Hz Tagiyev
Sumqayıt    13 mkr      Corat
Sumqayıt    13 mkr      Saray

Gəncə    Nizami     gulustan
Gəncə    Nizami     Yeni Gəncə
Gəncə    Nizami     Bağban
Gəncə    Kəpəz      gulustan
Gəncə    Kəpəz      Yeni Gəncə
Gəncə    Kəpəz      Bağban

Minqəçevir Null     Nur

Full Join 
ŞƏHƏR    RAYON   QƏSƏBƏ

Bakı     Xətayi         Bakıxanov
Baki     Xətayi         Ələt
Baki     Xətayi         Müşfiq
Baki     Xətayi         Zabrat
Baki     Yasamal        Bakıxanov
Baki     Yasamal        Ələt
Baki     Yasamal        Müşfiq
Baki     Yasamal        Zabrat
Baki     Suraxanı       Bakıxanov
Baki     Suraxanı       Ələt
Baki     Suraxanı       Müşfiq
Baki     Suraxanı       Zabrat

Sumqayıt    11 mkr      Hz Tagiyev
Sumqayıt    11 mkr      Corat
Sumqayıt    11 mkr      Saray
Sumqayıt    12 mkr      Hz Tagiyev
Sumqayıt    12 mkr      Corat
Sumqayıt    12 mkr      Saray
Sumqayıt    13 mkr      Hz Tagiyev
Sumqayıt    13 mkr      Corat
Sumqayıt    13 mkr      Saray

Gəncə    Nizami     gulustan
Gəncə    Nizami     Yeni Gəncə
Gəncə    Nizami     Bağban
Gəncə    Kəpəz      gulustan
Gəncə    Kəpəz      Yeni Gəncə
Gəncə    Kəpəz      Bağban

Xaçmaz   Xudat      Null

Minqəçevir Null     Nur

--2) Ishcilerin ad, soyad, departmentin nomresi ve department adi gosteren sorgu yazin(employees, departments cedvelleri)
    
    select first_name,
    last_name,
    e.department_id,
    department_name
    from employees e
    inner join departments d
    on e.department_id=d.department_id;

--3) Department nomresi 40 ve ya 80 olan ishcilerin ad, soyad, departmentin nomresi ve department adi gosteren sorgu yazin

    select 
    e.department_id,
    first_name,
    last_name,
    department_name
    from employees e
    inner join departments d
    on e.department_id=d.department_id
    where e.department_id in(40,80);

--4) Ishcilerin ad, soyad, departmentin nomresi ve department adi gosteren sorgu yazin(hansisa departamentde ishci olmasa bele onu gostersin)

    select 
    first_name,
    last_name,
    d.department_id,
    department_name
    from employees e
    right join departments d
    on e.department_id=d.department_id;

