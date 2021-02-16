use BikeStores
go

select p.product_id, p.product_name,/*p.brand_id,p.category_id,*/
	   p.model_year, ct.category_name, b.brand_name,
	   format(p.list_price, '$ #,#.00') as list_price
  from production.products as p
 inner join production.categories as ct
    on p.category_id = ct.category_id
 inner join production.brands as b
	on p.brand_id = b.brand_id;
--
select od.order_id, concat(cu.first_name,' ',cu.last_name) as full_name,
	   case od.order_status
	   when 1 then '주문'
	   when 2 then '결제완료'
	   when 3 then '배송시작'
	   when 4 then '배송완료'
	   else '이상사태'
	   end as '주문현황',
	   od.order_date, od.required_date, od.shipped_date,
	   sr.store_name, concat(st.first_name,' ',st.last_name) as staff_name
  from sales.orders as od
 inner join sales.customers as cu
	on od.customer_id = cu.customer_id
 inner join sales.staffs as st
	on od.staff_id = st.staff_id
 inner join sales.stores as sr
	on od.store_id = sr.store_id;
 