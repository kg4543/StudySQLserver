use sqlDB;
go

select ROW_NUMBER() over(order by height desc,userName asc) as '키큰순위', 
		userName, addr, height
		from userTbl;

-- 동일 등수 적용		
select RANK() over(order by height desc) as '키큰순위', 
		userName, addr, height
		from userTbl;

select RANK() over(partition by addr order by height desc) as '키큰순위', 
		userName, addr, height
		from userTbl;

--PIVOT
/*
create table pivotTbl
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTbl values ('김범수','겨울',10),
							('윤종신','여름',15),
							('김범수','가을',25),
							('김범수','봄',3),
							('김범수','봄',37),
							('윤종신','겨울',40),
							('김범수','여름',14),
							('김범수','겨울',22),
							('윤종신','여름',40)
insert into pivotTbl values ('성시경','여름',30);
go
*/


select * from pivotTbl;

select * from pivotTbl
	pivot (sum(amount)
			for season
			in ([봄],[여름],[가을],[겨울])) as resultPivot;


--Json
select userID,userName,addr,height
	from userTbl
	where height > 180
	for json auto;



