select
	*,
	(year(GETDATE()) - birthYear) + 1 as 나이
  from userTbl;

  -- 사용자 정의함수 활용
  select *,
	dbo.ufn_getAge(birthYear) as 나이,
	dbo.ufn_getZodiac(birthYear) as 띠
	from userTbl;