use sqlDB
go

-- ���ν��� ���� �Ǵ� ������ ���ÿ� 'create or alter'
create or alter procedure usp_users
as 
	select userID,userName,birthYear from userTbl
go

exec usp_users;

