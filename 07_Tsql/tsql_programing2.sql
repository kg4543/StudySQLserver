declare @year int; --년도 변수
set @year = 1980;

if @year >= 1980
	begin
		select * from userTbl where birthYear >= @year;
	end
else
	begin
		print '검색할 수 없습니다.';
	end