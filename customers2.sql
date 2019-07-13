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
	drop table Customer;
	
CREATE TABLE Customer (
  id SERIAL,
	first_name varchar(30) not null, 
  last_name VARCHAR(30) NOT NULL,
	primary key (id)
);


Insert into Customer (id, first_name, last_name) values
(1, 'Bob','Smith'),
(2, 'Jane','Davidson'),
(3, 'Jimmy','Bell'),
(4, 'Stephanie','Duke');

--View table
Select * from Customer;

drop table Customer_email;
--Create customer email
CREATE TABLE Customer_email (
  id SERIAL,
	email varchar(30) not null, 
  customer_id integer not null,
	primary key (id),
	foreign key(customer_id) references customer(id)
);


--Populate second email table
Insert into Customer_email (customer_id, email) values
(1, 'bobsmith@email.com'),
(2, 'jdavids@email.com'),
(3, 'jimmyb@email.com'),
(4, 'sd@email.com');

---View second table

Select * from Customer_email;

--Create customer phone
CREATE TABLE Customer_phone(
  id SERIAL,
	phone Varchar(30) not null,
	customer_id integer nut null,
  primary key id
	foreign key (customer_id) references customer(id)
);

--Populate third email table
Insert into Customer_email (id, customer_email) values
(1, 'bobsmith@email.com'),
(2, 'jdavids@email.com'),
(3, 'jimmyb@email.com'),
(4, 'sd@email.com');

---View second table

Select * from Customer_email;


