-- testTBL insert query
use sqlDB;
go

-- DML �� select
select * from testTbl1;

-- DML �� insert
insert into testTbl1 values (1, 'ȫ�浿', 25);
insert into testTbl1 (id, userName) values (2, '�����');
insert into testTbl1 (id, userName) values (3, '�����');
insert into testTbl1 (age, id) values (30, 4);
insert into testTbl1 (age, userName) values (30, '��û��'); --���� (PK�� ����)
insert into testTbl1 values (3, '�����'); --���� (�� ���� �� ����)

-- PK�� default �� �������� ���� ����
insert into testTbl1 values ('���ð�', 44);

exec sp_help 'testTbl1';
--
select IDENT_CURRENT('testTbl1');
select @@IDENTITY;

select * from BikeStores.sales.order_items;

select * from shopDB.dbo.memberTBL;

-- sale.order_items ���̺� ����
CREATE TABLE sales_order_items(
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
	);

insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;

-- update
select * from testTbl1;

update testTbl1
	set userName = '������',
		age = 30
	where id = 6;

	-- rollback; / begin �ʿ�

-- Delete
delete from testTbl1
 where id = 12;

 truncate table testTbl1;
 -- truncate�� ���� �� identity�� reset ��