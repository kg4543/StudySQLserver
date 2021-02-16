use sqlDB
go

declare cur_usertbl cursor global
	for select height from userTbl;

open cur_usertbl;

declare @userName nchar(8); --회원 이름
declare @height smallint; -- 회원의 키담는 변수
declare @cnt int = 0; --회원수(읽은 행수)
declare @totalHeight int = 0; --회원 키의 합계 변수

fetch next from cur_usertbl into @userName, @height; --Fetch란: 커서에서 원하는 결과값을 추출하는 것 / 추출한 결과물을 @height에 할당 

--반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt += 1;
	set @totalHeight += @height;
	print concat('회원: ',@userName,'키: ',@height);
	fetch next from cur_usertbl into @userName, @height;
	--print @@FETCH_STATUS;
end

print @totalHeight
print @cnt
print concat('회원 키 평균 => ', @totalHeight / @cnt);

close cur_usertbl;
deallocate cur_usertbl;

