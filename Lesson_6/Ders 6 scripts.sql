select * from employees;

--char(10),nvarchar2(10)
primary key,
unique--
not null 
check 
foreign key
default 


CREATE table MDA47
(Istirakci_id number primary key,
ad varchar2(50) unique not null,
baslama_tarixi date default sysdate,
yas number check(yas>18),
Soyad varchar2(50) 
)

insert into mda47 values(1,'Hafiz','01-May-2026',26,'Ocaqli')
insert into mda47 values(2,'Mahire','15-jun-2026',23)


insert into mda47(ISTIRAKCI_ID,ad,Soyad,yas,baslama_tarixi) values(4,'Fatime','Maliyeva',23,null)




drop table mda47
select * from mda47

delete from mda47
where baslama_tarixi is null
commit
rollback
ddl--create,drop,truncate,
dml--insert,delete,update,merge
DCL--commit,rollback,
TCL --grant, revoke


update mda47
set ad='Mahire'
where istirakci_id=4