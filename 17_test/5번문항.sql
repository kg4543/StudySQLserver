
-- 5
select  d.Names
		,sum(b.Price) as '���հ�ݾ�'
  from bookstbl as b
 inner join divtbl as d
	on b.Division = d.Division
 group by rollup (d.Names)
