-- create DB
create database Gamingevent;
show databases;
use Gamingevent;
-- create table players
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    player_rank INT,
    total_score INT,
    registration_date DATE
);
-- create table registrations
create table registrations(
registration_id int primary key,
player_id int,
event_id int, 
registration_date date,
FOREIGN KEY (player_id) references players(player_id),
FOREIGN KEY (event_id) references events(event_id)
);
alter table registrations
rename event_registrations;
-- create table events
create table events(
event_id int primary key,
event_name varchar(45),
game_id int,
event_date date,
prize_pool int,
status ENUM('Active', 'completed') NOT NULL DEFAULT 'Active',
foreign key (game_id) references games(game_id)
);
-- create table games
create table games(
game_id int primary key,
game_name varchar(45),
game_type varchar(45),
release_date date
);
-- create table matches
create table matches(
match_id int primary key,
event_id int,
match_date date,
match_status varchar(20),
foreign key (event_id) references events(event_id)
);
-- create table rankings
create table rankings(
rank_id int primary key,
player_id int,
event_id int,
position varchar(45),
points int,
FOREIGN KEY (player_id) references players(player_id),
FOREIGN KEY (event_id) references events(event_id)
);
-- create table player_stats
create table player_stats(
stat_id int primary key,
player_id int NOT NULL,
match_id int NOT NULL,
kills int default 0,
assists int default 0,
deaths int default 0,
score int,
FOREIGN KEY (player_id) REFERENCES players(player_id),
FOREIGN KEY (match_id) REFERENCES matches(match_id)
);
-- insert the values in the players table
INSERT INTO players(player_id, name, email, player_rank, total_score, registration_date)
VALUES
    (1, "AlexStorm", "player1@email.com", 4, 4175, '2025-01-12'),
    (2, "ShadowHunter", "player2@email.com", 7, 2116, '2025-01-20'),
    (3, "FrostByte", "player3@email.com", 4, 1120, '2025-01-17'),
    (4, "NightWolf", "player4@email.com", 8, 3611, '2025-01-14'),
    (5, "CyberPhoenix", "player5@email.com", 1, 4997, '2025-01-07'),
    (6, "DarkViper", "player6@email.com", 10, 2983, '2025-01-15'),
    (7, "NeonRogue", "player7@email.com", 3, 2170, '2025-01-17'),
    (8, "BlazeFury", "player8@email.com", 4, 2078, '2025-01-01'),
    (9, "IronClaw", "player9@email.com", 7, 4553, '2025-01-27'),
    (10, "ThunderStrike", "player10@email.com", 3, 4361, '2025-01-13'),
    (11, "PhantomBlade", "player11@email.com", 3, 2613, '2025-01-02'),
    (12, "CrimsonSpectre", "player12@email.com", 2, 2827, '2025-01-27'),
    (13, "SilentWraith", "player13@email.com", 6, 4112, '2025-01-07'),
    (14, "WarlockX", "player14@email.com", 10, 2264, '2025-01-05'),
    (15, "QuantumGhost", "player15@email.com", 1, 2973, '2025-01-09'),
    (16, "TitanSlayer", "player16@email.com", 8, 2304, '2025-01-28'),
    (17, "VenomEdge", "player17@email.com", 3, 4283, '2025-01-13'),
    (18, "MysticArcher", "player18@email.com", 1, 2716, '2025-01-22'),
    (19, "ChaosReaper", "player19@email.com", 5, 4061, '2025-01-23'),
    (20, "OmegaKnight", "player20@email.com", 2, 1461, '2025-01-05');
    -- insert the values in the registation table
insert into event_registrations(registration_id,player_id,event_id,registration_date)
values(1,17,9,'2025-05-11'),
(2,6,7,'2025-05-14'),
(3,14,7,'2025-05-19'),
(4,2,5,'2025-05-08'),
(5,12,3,'2025-05-12'),
(6,6,7,'2025-05-13'),
(7,10,10,'2025-05-14'),
(8,1,5,'2025-05-19'),
(9,12,9,'2025-05-20'),
(10,8,1,'2025-05-27'),
(11,16,10,'2025-05-06'),
(12,8,6,'2025-05-05'),
(13,18,8,'2025-05-22'),
(14,5,1,'2025-05-14'),
(15,18,9,'2025-05-04'),
(16,3,7,'2025-05-10'),
(17,9,10,'2025-05-17'),
(18,4,2,'2025-05-13'),
(19,16,8,'2025-05-09'),
(20,19,8,'2025-05-19');
DESC events;
ALTER TABLE events MODIFY COLUMN status ENUM('Active', 'Completed', 'Pending') NOT NULL;

-- insert the values in the events table
INSERT INTO events(event_id, event_name, game_id, event_date, prize_pool, status)
VALUES
    (1, "Winter Showdown", 4, '2025-06-24', 21972, 'Active'),
    (2, "Titan Arena", 5, '2025-06-15', 49792, 'Pending'),
    (3, "Cyber League Championship", 4, '2025-06-23', 21279, 'Pending'),
    (4, "Shadow Masters Tournament", 5, '2025-06-19', 14830, 'Pending'),
    (5, "Battle Royale Bash", 1, '2025-06-13', 40875, 'Completed'),
    (6, "Galactic Esports Cup", 4, '2025-06-20', 11852, 'Completed'),
    (7, "Iron Warriors Clash", 4, '2025-06-28', 38136, 'Pending'),
    (8, "The Last Stand", 4, '2025-06-05', 29936, 'Pending'),
    (9, "Phoenix Rising Invitational", 2, '2025-06-21', 23236, 'Completed'),
    (10, "Ultimate Gaming Fest", 3, '2025-06-26', 30653, 'Completed');

-- insert the values in the games table
insert into games(game_id,game_name,game_type,release_date)
values(1,"BattleFront X","Shooter",'2011-05-15'),
(2,"Shadow Warzone","Strategy",'2012-05-15'),
(3,"Cyber Clash 2049","MOBA",'2013-05-15'), 
(4,"Titan Siege","Battle Royale",'2014-05-15'),
(5,"Apex Commanders","Sci-Fi RPG",'2015-05-15');

-- insert the values in the matches table
insert into matches(match_id,event_id,match_date,match_status)
values(1,9,'2025-06-12',"scheduled"),
(2,9,'2025-06-12',"scheduled"),
(3,2,'2025-06-27',"scheduled"),
(4,8,'2025-06-15',"scheduled"),
(5,2,'2025-06-27',"completed"),
(6,6,'2025-06-14',"completed"),
(7,9,'2025-06-11',"scheduled"),
(8,9,'2025-06-14',"completed"),
(9,8,'2025-06-28',"scheduled"),
(10,6,'2025-06-17',"completed");

-- insert the values in the rankings table
insert into rankings(rank_id,player_id,event_id,position,points)
values(1,12,9,3,600),
(2,20,8,10,2496),
(3,2,5,8,2110),
(4,19,7,6,2433),
(5,20,7,7,4160),
(6,17,10,7,4968),
(7,11,8,8,2867),
(8,8,7,4,660),
(9,17,10,1,1873),
(10,15,5,8,2225),
(11,18,7,5,4837),
(12,12,4,4,2651),
(13,2,1,1,4727),
(14,9,9,3,4179),
(15,17,8,8,4502),
(16,20,3,3,3437),
(17,1,1,1,1394),
(18,9,9,5,2876),
(19,14,3,10,3464),
(20,9,10,9,2929);

-- insert the values in the player_stats table
insert into player_stats(stat_id,player_id,match_id,kills,assists,deaths,score)
values(1,3,9,6,13,9,3440),
(2,2,6,14,0,6,3512),
(3,12,4,12,3,5,1014),
(4,12,9,10,0,10,2206),
(5,7,5,17,1,18,4590),
(6,16,3,16,9,14,1736),
(7,7,2,20,8,14,2991),
(8,12,3,14,8,10,758),
(9,19,1,28,1,17,4264),
(10,19,8,23,15,5,3718),
(11,18,7,19,9,1,1027),
(12,16,8,9,4,7,2925),
(13,7,9,8,10,20,648),
(14,14,2,5,4,3,4394),
(15,19,7,14,6,13,1365),
(16,1,5,25,3,6,3289),
(17,20,7,21,0,5,2860),
(18,17,9,19,13,9,4911),
(19,16,2,5,11,11,4685),
(20,4,7,30,14,12,831);

-- create procedure for total players in the gaming event
DELIMITER //
create procedure count_players(out total int)
begin
select count(*) into total from players;
end //
delimiter ;
-- calling count of players
call count_players(@a);
select @a;
-- create procedure registered players
DELIMITER //
create procedure registered_players()
begin
select name,email from players;
end //
delimiter ;
-- calling registered players
call registered_players();
DELIMITER //
-- create procedure for list of all events
CREATE PROCEDURE list_all_events()
BEGIN
select event_name,prize_pool,status from events;
end //
DELIMITER ;
-- Calling the list of all events procedure
call list_all_events();
-- create procedure who registered for Titan Arena Event

DELIMITER //

CREATE PROCEDURE titanarena_events(IN titanarena VARCHAR(255))
BEGIN
    SELECT p.player_id, p.name, p.email, p.registration_date
    FROM players p
    JOIN event_registrations er ON p.player_id = er.player_id
    JOIN events e ON er.event_id = e.event_id
    WHERE e.event_name = titanarena;
END //
DELIMITER ;
-- call procedure for titan arena events
call titanarena_events("Titan Arena");

-- create procedure for top 5 players

DELIMITER //
CREATE PROCEDURE top_5_players()
BEGIN
    SELECT name, total_score 
    FROM players 
    ORDER BY total_score DESC 
    LIMIT 5;
END //
DELIMITER ;
-- call procedure for top 5 players
call top_5_players();
-- create procedure for highest prize pool
DELIMITER //
create procedure highest_prizepool()
BEGIN
select event_name,prize_pool from events
ORDER BY prize_pool DESC
limit 1;
end //
DELIMITER ;
-- call for procedure highest prizepool
call highest_prizepool();
-- create procedure matches with event names
DELIMITER //
create procedure match_event()
BEGIN
SELECT m.match_id, e.event_name, m.match_date, m.match_status
   FROM matches m
   JOIN events e ON m.event_id = e.event_id
   WHERE m.match_status = "completed";
   end //
   DELIMITER ;
-- call for procedure match_event
call match_event();   
-- create procedure total assists,death,kills
DELIMITER //

CREATE PROCEDURE total_assists_death_kills()
BEGIN
    SELECT p.name, SUM(ps.kills) AS total_kills, SUM(ps.assists) AS total_assists, SUM(ps.deaths) AS total_deaths
   FROM player_stats ps
   JOIN players p ON ps.player_id = p.player_id
   WHERE p.name = "ShadowHunter"
   GROUP BY p.name;
END //

DELIMITER ;

-- call for procedure match_event
call total_assists_death_kills();  
-- call procedure most kills in single match
DELIMITER //	
create procedure kills_in_match()
BEGIN
 SELECT p.name, ps.kills, ps.match_id
   FROM player_stats ps
   JOIN players p ON ps.player_id = p.player_id
   ORDER BY ps.kills DESC
   LIMIT 1 ;
END //
DELIMITER 	;
-- Call for procedure kills in match
call kills_in_match();
-- create procedure registered for each event
DELIMITER //
create procedure registered_each_event()
BEGIN
SELECT e.event_name, COUNT(er.player_id) AS total_registrations
   FROM events e
   LEFT JOIN event_registrations er ON e.event_id = er.event_id
   GROUP BY e.event_name;
end //
delimiter ;
-- call for procedure registered for each event
call registered_each_event();   

   
	
	
   

   





  


   

 

	


















  









