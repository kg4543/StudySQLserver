use tableDB;
go

create table #temptbl (id int, txt nvarchar(10));
create table ##temptbl (id int, txt nvarchar(10));

insert into #temptbl values (1, '지역임시테이블');
insert into ##temptbl values (2, '전역임시테이블');
go

select * from #temptbl;
select * from ##temptbl;