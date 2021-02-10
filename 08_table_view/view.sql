use sqlDB;
go

create view	uv_stdclubTbl
as
	select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s
  left outer join clubRegTbl as r  
	on s.id = r.std_id
  right outer join clubTbl as c
	on r.club_id = c.id
go

select * from uv_stdclubTbl;
