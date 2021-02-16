use sqlDB
go

-- userTbl�� ���� backup_triger �ۼ�
create trigger trg_backupUsertbl
on userTbl
--with encrytion : ���� / �����Ұ�
after update, delete --������Ʈ�� ���� ��
as
	declare @modType nchar(2)

	if(COLUMNS_UPDATED() > 0) -- ������Ʈ �ȴٸ�
	begin
		set @modType = '����';
	end
	else -- ������Ʈ�� �ȵǴ� ���: ����
	begin
		set @modType = '����';
	end

	--������ ������ ����
	insert into backup_userTbl
select [userID],[userName],[birthYear],[addr]
      ,[mobile1],[mobile2],[height],[mDate]
      ,@modType,GETDATE(),USER_NAME()
  FROM deleted; 
  

go