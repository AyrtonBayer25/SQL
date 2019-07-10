-- Database: birds

-- DROP DATABASE birds;

CREATE DATABASE birds
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	CREATE TabLE bird_song
	(english_name VARCHAR,
	country VARCHAR,
	latitude DEC,
	longitude dec);
	
SELECT count (*) FROM bird_song;

	