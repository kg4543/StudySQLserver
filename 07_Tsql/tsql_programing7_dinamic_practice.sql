use	sqlDB
go
--exec sp_helpdb;
declare @sql varchar(100);
set @sql = 'select * from userTbl where userID = ''EJW'';';
exec(@sql);
