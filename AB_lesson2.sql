-- Database: programming_db



CREATE DATABASE programming_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE programming_languages ( id SERIAL PRIMARY KEY, language VARCHAR (20), rating INT);

--Insert Table
INSERT INTO programming_languages (language, rating) 
		VALUES ('HTML', 90),
			('JS', 99),
			('JQuery', 98),
			('MYSQL', 70),
			('MYSQL', 70);

--View Table
SELECT * FROM programming_languages;

--Query for MYSQL
SELECT * FROM programming_languages
where language = 'MYSQL';


---Table
--VIEW

DELETE from programming_languages

