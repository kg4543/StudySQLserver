
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