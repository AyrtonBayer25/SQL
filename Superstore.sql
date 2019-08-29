-- Database: Superstore

-- DROP DATABASE "Superstore";

CREATE DATABASE "Superstore"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
Drop Table sample_superstore;
	
CREATE TABLE trans_data (
	bill_number varchar(50),
	trans_date	date,
	customer_id varchar(50),
	sku_number varchar(50),
	sales_prices decimal(21,2),
	item_desc varchar(255),
	dept varchar(255),
	sub_dept varchar(255),
	date_int int
);
	
SELECT * FROM trans_data;

----count the rows
SELECT COUNT (*) from trans_data;
--unique customers
select distinct(dept) from trans_data;

--count unique dept
select count(dept) from (select distinct(dept) from trans_data) as unique_table;
--Unique Customers
select distinct(customer_id) from trans_data;
--count unique customers
select count(customer_id) from (select distinct(customer_id) from trans_data) as unique_customers;

--count of unique sub
select dept as Department_Name, count(distinct sub_dept) CNT_Sub_department from trans_data
group by dept;
order by count(distinct sub_dept) desc;
---Dept select who dept doesnt start with "F"
select (dept) as Department_name, count (distinct sub_dept) cnt_sub_department from trans_data
where dept not like 'F%'
group by dept
order by count (distinct sub_dept) desc;

---filter greater than 5
select (dept) as Department_name, count (distinct sub_dept) cnt_sub_department from trans_data
group by dept
having count(distinct sub_dept) > 5
order by count (distinct sub_dept) desc;

--average sales
select avg (sales_prices) from trans_data;

--Unique customers
select count (distinct customer_id) from trans_data;

--AVerage sale per day
select trans_date, round(avg(sales_prices),2) as sls from trans_data group by trans_date;

--find the best day of a/each sales


--find day with max sale
select trans_date, round(sum(sales_prices),2) as Total_SLS_day from trans_data group by trans_date
order by round(sum(sales_prices),2) asc limit 1;
---Day min sales

select trans_date, Total_SLS_day from(select trans_date, round(sum(sales_prices),2) as Total_SLS_day from trans_data
group by trans_date
order by sum(sales_prices) asc limit 2)
order by Total_SLS_day asc limit 1;

---rank best sales day
select trans_date, round(sum(sales_prices),2) as Total_SLS_day, 
rank() over (order by round(sum(sales_prices),2)) as RNK
from trans_data
group by trans_date;


---top 10 customers
select * from (
select customer_id, round(sum(sales_prices),2) as Total_SLS_day, 
rank() over (order by round(sum(sales_prices),2) desc) as RNK
from trans_data
group by customer_id) as abc_table
where RNK <= 10;

---worst performing dept
select * from (
select dept, round(sum(sales_prices),2) as Total_SLS_day, 
rank() over (order by round(sum(sales_prices),2) asc) as RNK
from trans_data
group by dept) as abc_table
where RNK >= 1

--count visits to the store based off customer id
select * from (
select customer_id, count(distinct bill_number) as Total_visits, 
rank() over (order by count(distinct bill_number) desc) as RNK
from trans_data
group by customer_id) as abc_table
where RNK <= 10

---Most frequent buyer based off total revenue
select * from (
select customer_id, round(sum(sales_prices),2) as Total_SLS_day, 
rank() over (order by round(sum(sales_prices),2) desc) as RNK
from trans_data
group by customer_id) as abc_table
where RNK <= 10;

--rank item Number based off total sales
select 'Purchases' as LBL, customer_id, MSR from (
select customer_id, round(sum(sales_prices),2) as MSR, 
rank() over (order by round(sum(sales_prices),2) desc) as RNK
from trans_data
group by customer_id) as abc_table
where RNK <= 10
UNION all


select customer_id from (
select customer_id, round(sum(sales_prices),2) as Total_SLS_day, 
rank() over (order by round(sum(sales_prices),2) desc) as RNK
from trans_data
group by item_desc) as abc_table
where RNK <= 10;




