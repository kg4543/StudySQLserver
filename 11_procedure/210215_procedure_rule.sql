use sqlDB
go

create or alter procedure usp_buyproduct
	@userID char(8)
as
	select num,userID, prodName,(price * amount) as 'ÃÑ±¸¸Å±Ý¾×' 
	  from buyTbl
	 where userID = @userID;
go

exec usp_buyproduct 'BBK';
