use sqlDB;
go
create or alter function ufn_getZodiac(@birthYear int)
returns nchar(3)
as
begin
	declare @result nchar(3);
	set @result = 
		case
			when (@birthYear % 12 = 0) then '¿ø¼şÀÌ'
			when (@birthYear % 12 = 1) then '´ß'
			when (@birthYear % 12 = 2) then '°³'
			when (@birthYear % 12 = 3) then 'µÅÁö'
			when (@birthYear % 12 = 4) then 'Áã'
			when (@birthYear % 12 = 5) then '¼Ò'
			when (@birthYear % 12 = 6) then 'È£¶ûÀÌ'
			when (@birthYear % 12 = 7) then 'Åä³¢'
			when (@birthYear % 12 = 8) then '¿ë'
			when (@birthYear % 12 = 9) then '¹ì'
			when (@birthYear % 12 = 10) then '¸»'
			else '¾ç'
		end;
		return @result;
end
go