-- Database: customers

-- DROP DATABASE customers;

CREATE DATABASE customers
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE Customer (
  id SERIAL PRIMARY KEY,
  customer_name VARCHAR(30) NOT NULL
);


Insert into Customer (id, customer_name) values
(1, 'Bob Smith'),
(2, 'Jane Davidson'),
(3, 'Jimmy Bell'),
(4, 'Stephanie Duke');

--View table
Select * from Customer;