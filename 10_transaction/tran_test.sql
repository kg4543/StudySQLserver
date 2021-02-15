USE [sqlDB]
GO

begin try
	begin tran;

INSERT INTO [dbo].[userTbl]
           ([userID]
           ,[userName]
           ,[birthYear]
           ,[addr]
           ,[mobile1]
           ,[mobile2]
           ,[height]
           ,[mDate])
     VALUES
           (
		   'GJY'
		   ,'권지용'
		   ,1988
		   ,'서울'
		   ,'010'
		   ,'98989898'
		   ,178
		   ,GETDATE()
		   )

INSERT INTO [dbo].[buyTbl]
           ([userID]
           ,[prodName]
           ,[groupName]
           ,[price]
           ,[amount])
     VALUES
           ('GJY'
		   ,'선글라스'
		   ,'패션'
		   ,80000000
		   ,1
		   )
	commit;
	end try
	begin catch
	rollback;
	end catch
GO
