--outer join query
select r.rentalidx
      ,m.memberName
	  ,c.cateName
      ,b.bookName
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일' 
      ,isnull((format(r.returnDt, 'yyyy-MM-dd')), '') as '반납일'
      ,dbo.ufn_getstate(r.rentalState) as '대여상태'
  from rentalTbl as r
 right join memberTbl as m
	on r.memberIdx = m.memberidx
  left join booksTbl as b
    on r.bookidx = b.bookidx
  left join cateTbl as c
    on b.cateidx = c.cateidx
 where rentalidx is null