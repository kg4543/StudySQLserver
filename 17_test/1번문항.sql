
-- 1-1
select lower(Email) as 'email'
	   ,Mobile
	   ,Names
	   ,Addr 
  from membertbl

-- 1-2
select Names
	  ,Author
	  ,ReleaseDate
	  ,Price 
 from bookstbl