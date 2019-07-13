-- Database: join

-- DROP DATABASE "join";

CREATE DATABASE "join"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS games;

CREATE TABLE toys (
    toy_id SERIAL,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE games (
    game_id SERIAL,
    type VARCHAR,
    name VARCHAR
);

INSERT INTO toys (type, name)
VALUES
('sports', 'baseball'),
('adventure', 'staff'),
('sports', 'tennis ball'),
('fun', 'doll');

INSERT INTO games (type, name)
VALUES
('sports', 'tag'),
('adventure', 'Kings Quest'),
('sports', 'tennis'),
('fun', 'Make believe');

Select * from toys where toy_id >=2
union
select * from games where game_id >=2;