use sqlDB;
go

/*
create table bankbook
	( uName nvarchar(10)
	, uMoney Int
	 constraint CK_money
	 check (uMoney >=0));
go

insert into bankbook values (N'구매자',1000);
insert into bankbook values (N'판매자',0);
*/

--update bankbook set uMoney = uMoney - 600 where uName = N'판매자';

begin try
begin tran
update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
commit tran
end try
begin catch
	rollback
end catch

select * from bankbook;

	