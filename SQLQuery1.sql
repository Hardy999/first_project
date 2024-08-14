use Bikestore_project;

-- updating null values for dates in sales.orders tables

select * from sales.orders
where shipped_date = NULL

update sales.orders
set  shipped_date = '2016-04-23'
where order_id = 185;