use BookRentalShopDB
go

--사용자 level 리턴함수
create or alter function dbo.ufn_getlevels(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5); --관리자/골드회원/실버회원...
	set @result = case @levels
		when 'A' then '골드회원'
		when 'B' then '실버회원'
		when 'C' then '일반회원'
		when 'D' then '블랙'
		when 'S' then '관리자'
		else '비회원'
		end;
	return @result;
end;
