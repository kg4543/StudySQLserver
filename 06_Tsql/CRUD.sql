-- testTBL insert query
use sqlDB;
go

-- DML 중 select
select * from testTbl1;

-- DML 중 insert
insert into testTbl1 values (1, '홍길동', 25);
insert into testTbl1 (id, userName) values (2, '이재명');
insert into testTbl1 (id, userName) values (3, '김순경');
insert into testTbl1 (age, id) values (30, 4);
insert into testTbl1 (age, userName) values (30, '이청장'); --에러 (PK값 부재)
insert into testTbl1 values (3, '김순경'); --에러 (값 전부 안 넣음)

-- PK값 default 값 설정이후 생략 가능
insert into testTbl1 values ('성시경', 44);

exec sp_help 'testTbl1';
--
select IDENT_CURRENT('testTbl1');
select @@IDENTITY;

select * from BikeStores.sales.order_items;

select * from shopDB.dbo.memberTBL;

-- sale.order_items 테이블 복사
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
	set userName = '성수경',
		age = 30
	where id = 6;

	-- rollback; / begin 필요

-- Delete
delete from testTbl1
 where id = 12;

 truncate table testTbl1;
 -- truncate로 삭제 시 identity가 reset 됨