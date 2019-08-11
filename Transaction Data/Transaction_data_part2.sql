-- Database: SQL_tables_and_subqueries

-- DROP DATABASE "SQL_tables_and_subqueries";

CREATE DATABASE "SQL_tables_and_subqueries"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
Drop table trans_data;

CREATE TABLE trans_data (
bill_number varchar(50),
trans_date date,
customer_id varchar(50),
sku_number varchar(50),
sales_prices decimal(21,2),
item_desc varchar(255),
dept varchar(255),
sub_dept varchar(255),
date_int int
);

--Show the first 10 rows of data
SELECT * FROM trans_data limit 10;

--Count total number of rows
SELECT count(*) from trans_data;

--count the number of unique departments
SELECT COUNT(distinct dept) FROM trans_data;

--display the names of the unique departments
select distinct dept from trans_data;

--Display the names of tbe unique departments & number of subdepts
SELECT dept, count(distinct sub_dept) from trans_data group by dept;

---Change the column names
SELECT dept as Department_Name, count(distinct sub_dept) Cnt_Sub_Department from trans_data group by dept;

----Sort by a number of Sub Departments
select dept as Department_Name, count(distinct sub_dept) Cnt_Sub_Department from trans_data 
group by dept
order by count(distinct sub_dept) desc;

---Filter depts where name starts with F
SELECT dept as Department_Name, count(distinct sub_dept) Cnt_Sub_Department from trans_data
where dept not like '%F'
group by dept
order by count (distinct sub_dept) desc;

-- Filter before aggregation = "where"
-- Filter after aggregation = "having"
-- Filter out rows where count of sub depts < 5
select dept as Department_Name, count(distinct sub_dept) Cnt_Sub_Department from trans_data 
group by dept
having count(distinct sub_dept) > 5
order by count(distinct sub_dept)  desc;

---Count the number of unique customers
SELECT count(distinct customer_id) from trans_data;

-- Average sales per day
select trans_date, round(avg(sales_prices),2) as sls from trans_Data group by trans_date;

--Total sales per day
SELECT trans_date, round(sum(sales_prices),2) as Tot_sls_day from trans_data group by trans_date;

--For each month, which was the highest sales day.
SELECT trans_date, round(sum(sales_prices),2) as Tot_sls_day from trans_data group by trans_date
order by round(sum(sales_prices),2) asc limit 1;

---Find the day with the maximum sales
SELECT trans_date, round(sum(sales_prices),2) as Tot_sls_day from trans_data group by trans_date
order by round(sum(sales_prices),2) desc limit 2;
