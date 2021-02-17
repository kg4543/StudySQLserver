create or alter function ufn_getstate(@rentalState char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5); --대여중/반납/연체중/분실
	set @result = case @rentalState
		when 1 then '대여중'
		when 2 then '반납'
		when 3 then '연체중'
		when 4 then '분실'
		else '대여안함'
	end
	return @result;
end
go