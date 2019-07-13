-- Database: Activity_3

-- DROP DATABASE "Activity_3";

CREATE DATABASE "Activity_3"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
CREATE Table owners(ID INT Primary key not null,
						owner_name VARCHAR(255)
					   );
	
Insert into owners (ID, owner_name) Values
(1, 'Sally'),
(2, 'Charles'),
(3, 'Angela'),
(4, 'Kelly'),
(5, 'Sam'),
(6, 'Cassie');

Select * from owners;

--create pet names table
Create table pet_names (
ID INT not null primary key, 
owner_id int not null,
pet_name varchar(255),
type varchar(255)
);

Insert into pet_names (ID, owner_id, pet_name, type) Values
(10, 1, 'Zeus', 'Dog'),
(11, 1, 'Fido', 'Dog'),
(12, 2, 'Kevin', 'Dog'),
(13, 3, 'Sprinkles', 'Cat'),
(14, 4, 'Jumper', 'Cat'),
(15, 5, 'Happy', 'Rabbit'),
(16, 6, 'Rex', 'Dog'),
(17, 7, 'Carrot', 'Rabbit');

Select * from pet_names;


	
	