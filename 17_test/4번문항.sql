
-- 4-1
insert into divtbl
values ('I002','자기개발서');

--4-2
begin tran;
update membertbl
   set Addr = '부산시  해운대구'
	   ,Mobile = '010-6683-7732'
 where idx = 26

rollback;
commit;

