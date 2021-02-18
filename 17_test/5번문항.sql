
-- 5
select  d.Names
		,sum(b.Price) as 'ÃÑÇÕ°è±Ý¾×'
  from bookstbl as b
 inner join divtbl as d
	on b.Division = d.Division
 group by rollup (d.Names)
