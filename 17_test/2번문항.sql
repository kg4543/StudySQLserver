
-- 2-1
select top 10
		concat(right(Names, 2), ',',left(Names, 1)) as '변경이름' 
	   ,Levels
	   ,left(addr,2) as '도시'
	   ,lower(email) as '이메일'
  from membertbl 

-- 2-2
select idx
	   ,concat('제목 : ',Names) as Names
	   ,concat('저자 > ',Author) as Author
	   ,format(ReleaseDate, 'yyyy년MM월dd일') as '출판일'
	   ,ISBN
	   ,format(Price, '#,#원') as '가격'
  from bookstbl
 order by idx desc