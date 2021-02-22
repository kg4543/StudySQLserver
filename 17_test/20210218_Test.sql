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
		concat(right(Names, 2), ',',left(Names, 1)) as '변경이름' 
	   ,Levels
	   ,left(addr,2) as '도시'
	   ,lower(email) as '이메일'
  from membertbl 

-- 2-2
select idx
	   ,concat('제목 : ',Names) as Names
	   ,concat('저자 > ',Author) as Author
	   ,format(ReleaseDate, 'yyyy년MM월dd일') as '출판일'
	   ,ISBN
	   ,format(Price, '#,#원') as '가격'
  from bookstbl
 order by idx desc

 -- 3-1
select  b.Idx as '번호'
		,b.Division as '장르번호'
		,d.Names as '장르'
		,b.Names as '책제목'
		,b.Author as '저자'
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
values ('I002','자기개발서');

--4-2
begin tran;
update membertbl
   set Addr = '부산시  해운대구'
	   ,Mobile = '010-6683-7732'
 where idx = 26

rollback;
commit;

-- 5
select  d.Names as names
		,sum(b.Price) as '총합계금액'
  from bookstbl as b
 inner join divtbl as d
	on b.Division = d.Division
 group by rollup (d.Names)
