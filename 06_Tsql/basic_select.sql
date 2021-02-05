/*
select memberID,memberName 
  from memberTBL
 where memberID like 'H%';
 */

 use BikeStores;

 select * from sales.customers;

 select * from production.products;

 --DB 조회
 exec sp_helpdb;
 --Table 조회
 exec sp_tables @table_type = "'TABLE'";
 --열이름 조회
 exec sp_columns @table_name = 'stocks',
				 @table_owner = 'production';