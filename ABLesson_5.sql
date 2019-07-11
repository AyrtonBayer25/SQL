-- Database: MISC

-- DROP DATABASE "MISC";

CREATE DATABASE "MISC"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;





Drop table players;

	CREATE TABLE players (
	player_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hand VARCHAR,
	country_code VARCHAR
	);

---check the import of data

SELECT * FROM players;

---create the matches 
CREATE TABLE matches (
loser_age dec,
loser_id int,
loser_name varchar,
loser_rank int,
winner_age dec,
winner_id int,
winner_name VARCHAR,
winner_rank int);

--check data import for matches

SELECT * FROM matches;


---perform an inner join on the two tables
select players.first_name, players.last_name, players.hand, matches.loser_rank
from matches
inner join players on
players.player_id=matches.loser_id;

--Alternative solution:
--perform an inner join on the two tables

select p.first_name, p.last_name, p.hand, m.loser_rank
from matches as m
inner join players as p on
p.player_id=m.loser_id;



	