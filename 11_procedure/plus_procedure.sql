use sqlDB
go 

create or alter procedure plusNew
	@p1 int, --�Է��Ķ����
	@p2 int, --�Է��Ķ����
	@pout int output --����Ķ����
as
	select @pout = @p1 + @p2
go

declare @newResult int;
set @newResult = 0;
exec plusNew 1,2, @newResult output;
print concat('PluseNew(1,2) = ',@newResult);