use sqlDB;
go

create or alter function ufn_getAge
(	@birthYear int
)
returns int
as
begin
	declare @age int;
	set @age = (year(getdate()) - @birthYear) + 1;
	return @age;
end
go