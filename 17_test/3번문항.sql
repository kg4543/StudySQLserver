
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