use sqlDB
go

-- userTbl에 대한 backup_triger 작성
create trigger trg_backupUsertbl
on userTbl
--with encrytion : 보안 / 수정불가
after update, delete --업데이트나 삭제 시
as
	declare @modType nchar(2)

	if(COLUMNS_UPDATED() > 0) -- 업데이트 된다면
	begin
		set @modType = '수정';
	end
	else -- 업데이트가 안되는 경우: 삭제
	begin
		set @modType = '삭제';
	end

	--삭제된 내용을 저장
	insert into backup_userTbl
select [userID],[userName],[birthYear],[addr]
      ,[mobile1],[mobile2],[height],[mDate]
      ,@modType,GETDATE(),USER_NAME()
  FROM deleted; 
  

go