use sqlDB;
go

/*
create table bankbook
	( uName nvarchar(10)
	, uMoney Int
	 constraint CK_money
	 check (uMoney >=0));
go

insert into bankbook values (N'������',1000);
insert into bankbook values (N'�Ǹ���',0);
*/

--update bankbook set uMoney = uMoney - 600 where uName = N'�Ǹ���';

begin try
begin tran
update bankbook set uMoney = uMoney - 600 where uName = N'������';
update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';
commit tran
end try
begin catch
	rollback
end catch

select * from bankbook;

	