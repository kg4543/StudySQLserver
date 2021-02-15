use sqlDB
go 

create or alter procedure plusNew
	@p1 int, --입력파라미터
	@p2 int, --입력파라미터
	@pout int output --출력파라미터
as
	select @pout = @p1 + @p2
go

declare @newResult int;
set @newResult = 0;
exec plusNew 1,2, @newResult output;
print concat('PluseNew(1,2) = ',@newResult);