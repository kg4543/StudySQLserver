
-- 2-1
select top 10
		concat(right(Names, 2), ',',left(Names, 1)) as '�����̸�' 
	   ,Levels
	   ,left(addr,2) as '����'
	   ,lower(email) as '�̸���'
  from membertbl 

-- 2-2
select idx
	   ,concat('���� : ',Names) as Names
	   ,concat('���� > ',Author) as Author
	   ,format(ReleaseDate, 'yyyy��MM��dd��') as '������'
	   ,ISBN
	   ,format(Price, '#,#��') as '����'
  from bookstbl
 order by idx desc