use tableDB;
go

create table #temptbl (id int, txt nvarchar(10));
create table ##temptbl (id int, txt nvarchar(10));

insert into #temptbl values (1, '�����ӽ����̺�');
insert into ##temptbl values (2, '�����ӽ����̺�');
go

select * from #temptbl;
select * from ##temptbl;