use sqlDB
go

create trigger trg_testtbl
on testTbl
after delete,update --삭제, 수정할 때 트리거 발생
as
	print '트리거 발생';

insert into testTbl values ('마마무');
select * from testTbl where txt = '마마무';
update testTbl set txt = '트리거' where id = 9; --트리거 발생
delete TestTbl where id = 9; --트리거 발생