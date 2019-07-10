-- Database: hide_and_seek

-- DROP DATABASE hide_and_seek;

CREATE DATABASE hide_and_seek
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE TabLE hide_and_seek
	(author VARCHAR,
	word1 VARCHAR,
	word2 VARCHAR,
	source VARCHAR);
	
SELECT count (*) FROM hide_and_seek;


--View Word1

Select * from hide_and_seek 
where word1 = 'read';