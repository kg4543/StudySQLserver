select
	*,
	(year(GETDATE()) - birthYear) + 1 as ����
  from userTbl;

  -- ����� �����Լ� Ȱ��
  select *,
	dbo.ufn_getAge(birthYear) as ����,
	dbo.ufn_getZodiac(birthYear) as ��
	from userTbl;