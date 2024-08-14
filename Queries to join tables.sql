USE  Bikestore_project;

select * from sales.stores
select * from sales.customers
select * from sales.staffs
-- using joins 

-- JOINING SALES.ORDERS TABLE TO SALES.CUSTOMERS TABLE 
SELECT 
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS name,
	cus.city,
	cus.state,
	ord.order_date
FROM sales.orders  ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id

 -- sales volume and total revenue generated
 SELECT 
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS customers_name,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) as 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
-- ADDING PRODUCT NAME
	pro.product_name
FROM sales.orders  ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
GROUP BY
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name


-- category of products purchased

 SELECT 
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS customers_name,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	-- ADDING PRODUCT NAME
	pro.product_name,
	cat.category_name
FROM sales.orders  ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id =  cat.category_id
GROUP BY
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name


-- store at which the sales took place

 SELECT 
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS customers_name,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
-- ADDING PRODUCT NAME
	pro.product_name,
	cat.category_name,
	sto.store_name

FROM sales.orders  ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
join production.categories cat
ON pro.category_id =  cat.category_id
JOIN sales.stores sto
ON sto.store_id =  ord.store_id 
GROUP BY
    ord.order_id,
	concat(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name


-- sales rep who made sale

 SELECT 
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS customers_name,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
-- ADDING PRODUCT NAME
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT( stf.first_name, ' ', stf.last_name) AS 'sales_rep'
FROM sales.orders  ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id =  cat.category_id
JOIN sales.stores sto
ON sto.store_id =  ord.store_id 
JOIN sales.staffs stf
ON stf.staff_id = ord.staff_id
GROUP BY
    ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT( stf.first_name, ' ', stf.last_name)