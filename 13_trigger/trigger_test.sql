use sqlDB
go

create trigger trg_testtbl
on testTbl
after delete,update --����, ������ �� Ʈ���� �߻�
as
	print 'Ʈ���� �߻�';

insert into testTbl values ('������');
select * from testTbl where txt = '������';
update testTbl set txt = 'Ʈ����' where id = 9; --Ʈ���� �߻�
delete TestTbl where id = 9; --Ʈ���� �߻�