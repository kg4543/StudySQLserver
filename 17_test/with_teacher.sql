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
 
 -- 3-1-1 (No use join)
select b.Idx as '번호'
	   ,b.Division as '장르 번호'
	   ,d.Names as '장르'
	   ,b.Names as '책제목'
	   ,b.Author as '저자'
  from bookstbl as b
	   ,divtbl as d
 where d.Division = b.Division
   and d.Division = 'B002'

    -- 3-1-2 (서브쿼리)
select  b.Idx as '번호'
		,b.Division as '장르번호'
		--,d.Names as '장르'
		,(select Names from divtbl where Division = b.Division) as '장르'
		,b.Names as '책제목'
		,b.Author as '저자'
  from bookstbl as b
 where b.Division = 'B002'

-- 3-2
 select m.Names
	   ,m.Levels
	   ,m.Addr
	   ,r.rentalDate
  from rentaltbl as r
 right outer join membertbl as m
	on r.memberIdx = m.Idx
 where r.Idx is null

 -- 3-2-1 (No use join)
 select m.Names
	   ,m.Levels
	   ,m.Addr
	   --rentalDate: 전부 Null값이 아니면 불가능
	   ,(select rentalDate from rentaltbl where memberIdx not in (select idx from membertbl)) as 'rentalDate'
	   --,(select rentalDate from rentaltbl where (select memberIdx from rentaltbl) in (select idx from membertbl)) as 'rentalDate'
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r)
