begin try
	insert into userTbl values ('LSG','이상구',1988,'경기',null,null,170,GETDATE())
	print '저장 성공';
end try

begin catch
	print '저장 실패, 관리자에게 문의 요망';
end catch