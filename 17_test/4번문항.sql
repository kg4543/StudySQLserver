
-- 4-1
insert into divtbl
values ('I002','�ڱⰳ�߼�');

--4-2
begin tran;
update membertbl
   set Addr = '�λ��  �ؿ�뱸'
	   ,Mobile = '010-6683-7732'
 where idx = 26

rollback;
commit;

