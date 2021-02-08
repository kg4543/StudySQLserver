use BikeStores;
go

select * from sales.customers;

select * from sales.customers
where last_name like 'S%' 
and state = 'NY'
and phone is not null
order by first_name asc;