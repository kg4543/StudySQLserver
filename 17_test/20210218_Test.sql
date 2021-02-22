-- 1-1
select lower(Email) as 'email'
	   ,Mobile
	   ,Names
	   ,Addr 
  from membertbl
 order by Names desc

-- 1-2
select Names
	  ,Author
	  ,ReleaseDate
	  ,Price 
 from bookstbl

 -- 2-1
select top 10
		concat(right(Names, 2), ',',left(Names, 1)) as '�����̸�' 
	   ,Levels
	   ,left(addr,2) as '����'
	   ,lower(email) as '�̸���'
  from membertbl 

-- 2-2
select idx
	   ,concat('���� : ',Names) as Names
	   ,concat('���� > ',Author) as Author
	   ,format(ReleaseDate, 'yyyy��MM��dd��') as '������'
	   ,ISBN
	   ,format(Price, '#,#��') as '����'
  from bookstbl
 order by idx desc

 -- 3-1
select  b.Idx as '��ȣ'
		,b.Division as '�帣��ȣ'
		,d.Names as '�帣'
		,b.Names as 'å����'
		,b.Author as '����'
  from bookstbl as b
 inner join divtbl as d
    on d.Division = b.Division
 where d.Division = 'B002'

-- 3-2
select m.Names
	   ,m.Levels
	   ,m.Addr
	   ,r.rentalDate
  from rentaltbl as r
 right outer join membertbl as m
	on r.memberIdx = m.Idx
 where r.Idx is null

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

-- 5
select  d.Names as names
		,sum(b.Price) as '���հ�ݾ�'
  from bookstbl as b
 inner join divtbl as d
	on b.Division = d.Division
 group by rollup (d.Names)
