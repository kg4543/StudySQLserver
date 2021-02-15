use sqlDB
go

-- 프로시저 생성 또는 수정을 동시에 'create or alter'
create or alter procedure usp_users
as 
	select userID,userName,birthYear from userTbl
go

exec usp_users;

