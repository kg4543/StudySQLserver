begin try
	insert into userTbl values ('LSG','�̻�',1988,'���',null,null,170,GETDATE())
	print '���� ����';
end try

begin catch
	print '���� ����, �����ڿ��� ���� ���';
end catch