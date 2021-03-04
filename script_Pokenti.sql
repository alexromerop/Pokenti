
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS pokentis_types;

DROP TABLE IF EXISTS evolutions;

DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS current_stats;

DROP TABLE IF EXISTS pokentis_players;
DROP TABLE IF EXISTS catched;
DROP TABLE IF EXISTS team;

DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS pokentis;


CREATE TABLE pokentis (
	id_pokenti INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(16) NOT NULL,
	number_ INT NOT NULL );

INSERT INTO pokentis (name, number_) VALUES
	('Bulbasaur',1),
	('Ivysaur',2),
	('Venusaur',3),
	('Charmander',4),
	('Charmaleon',5),
	('Charizard',6),
	('Squirtle',7),
	('Wartortle',8),
	('Blastoise',9),
	('Caterpie',10),
	('Metapod',11),
	('Butterfree',12),
	('Weedle',13),
	('Kakuna',14),
	('Beedrill',15),
	('Pidgey',16),
	('Pidgeotto',17),
	('Pidgeot',18);

	CREATE TABLE team (
	id_team INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

	INSERT INTO team (id_pokenti) VALUES
		(11),
		(8),
		(15),
		(4);

	CREATE TABLE catched (
		id_catched INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		id_pokenti INT UNSIGNED NOT NULL,
		FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

	INSERT INTO catched (id_pokenti) VALUES
		(11),
		(17),
		(13),
		(16),
		(11),
		(13);



	CREATE TABLE evolutions (
		id_evolutions INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
		can BOOLEAN,
		lvl INT,
		evolution VARCHAR(16),
		id_pokenti INT UNSIGNED NOT NULL,
		FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO evolutions (can, lvl, evolution, id_pokenti) VALUES (
	(1, 16,'Ivysaur', 1),
	(1, 32,'Venusaur', 2),
	(0, NULL, NULL, 3),
	(1, 16, 'Charmeleon', 4),
	(1, 36, 'Charizard', 5),
	(0, NULL, NULL, 6),
	(1, 16, 'Wartortle', 7),
	(1, 36, 'Blastoise', 8),
	(0, NULL, NULL, 9),
	(1, 7, 'Metapod', 10),
	(1, 10, 'Butterfree', 11),
	(1, NULL, NULL, 12),
	(1, 7, 'Kakuna', 13),
	(1, 10,'Beedrill', 14),
	(0, NULL, NULL, 15),
	(1, 18, 'Pidgeotto', 16),
	(1, 36, 'Pidgeot', 17),
	(0, NULL, NULL, 18) );


CREATE TABLE types (
	id_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	primary VARCHAR(16) NOT NULL,
	secondary VARCHAR(16) NOT NULL );

INSERT INTO types (primary, secondary) VALUES
	('Grass', 'Poison'),
	('Fire', NULL),
	('Fire', 'Dragon'),
	('Water', NULL),
	('Bug', NULL),
	('Bug', 'Fliyng'),
	('Bug', 'Poison'),
	('Normal', 'Flying'),
	('Normal', NULL);

CREATE TABLE pokentis_types (
	id_pokenti_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	id_type INT UNSIGNED NOT NULL,
	FOREING KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	FOREING KEY (id_type) REFERENCES types(id_type) );

INSERT INTO pokentis_types (id_pokenti, id_type) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 3),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 5),
	(11, 5),
	(12, 6),
	(13, 7),
	(14, 7),
	(15, 7),
	(16, 8),
	(17, 8),
	(18, 8);

CREATE TABLE players (
	id_player INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player VARCHAR(24) NOT NULL );

INSERT INTO players (player) VALUES
	('Ash'),
	('Misty'),
	('Brock');

CREATE TABLE players_pokentis (
	id_players_pokentis INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_player INT UNSIGNED NOT NULL
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	FOREIGN KEY (id_player) REFERENCES players(id_player) );

INSERT INTO players_pokentis (id_player, id_pokentis) VALUES
	(1, 7),
	(1, 10),
	(1, 16),
	(2, 1),
	(2, 12),
	(3, 4),
	(3, 18);

CREATE TABLE stats (
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hp INT NOT NULL,
	atk INT NOT NULL,
	def INT NOT NULL,
	special INT NOT NULL,
	speed INT NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO stats (hp, atk, def, special, speed, id_pokenti) VALUES
	(45, 49, 49, 65, 45, 1),
	(60, 62, 63, 80, 60, 2),
	(80, 82, 83, 100, 80, 3),
	(39, 52, 43, 60, 65, 4),
	(58, 64, 58, 80, 80, 5),
	(78, 84, 78, 109, 100, 6),
	(44, 48, 65, 50, 43, 7),
	(59, 63, 80, 65, 58, 8),
	(79, 83, 100, 85, 78, 9),
	(45, 30, 35, 20, 45, 10),
	(50, 20, 55, 25, 30, 11),
	(60, 45, 50, 90, 70, 12),
	(40, 35, 30, 20, 50, 13),
	(45, 25, 50, 25, 35, 14),
	(65, 90, 40, 45, 75, 15),
	(40, 45, 40, 35, 56, 16),
	(63, 60, 55, 50, 71, 17),
	(83, 80, 75, 70, 101, 18);

CREATE TABLE current_stats (
	id_current_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	curr_level INT NOT NULL,
	curr_hp INT NOT NULL,
	curr_atk INT NOT NULL,
	curr_def INT NOT NULL,
	curr_special INT NOT NULL,
	curr_speed INT NOT NULL,
	curr_exp INT NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO current_stats (curr_level, curr_hp, cur_atk, curr_def, curr_special, curr_speed, curr_exp, id_pokenti) VALUES
	(5, 13, 32, 60, 15, 15, 31, 1),
	(18, 26, 43, 40, 45, 75, 15, 2),
	(58, 8, 18, 56, 10, 38, 55, 3),
	(6, 13, 32, 60, 35, 45, 39, 4),
	(23, 6, 20, 55, 40, 40, 39, 5),
	(35, 47, 54, 48, 19, 18,  43, 6),
	(21, 42, 41, 35, 50, 6,  24, 7),
	(9, 51, 73, 20,  10, 58, 14, 8),
	(36, 7, 47, 48, 15, 78, 20, 9),
	(91, 41, 31, 10, 20, 45, 15, 10),
	(100, 45, 10, 45, 25, 30, 5, 11),
	(12, 76, 45, 40, 47, 48, 45, 12),
	(8, 43, 35, 20, 24, 20, 50,  13),
	(33, 14, 25, 20, 55, 40, 35, 14),
	(84, 86, 10, 14, 40, 40, 75, 15),
	(1, 42, 5, 40, 47, 54, 25, 16),
	(25, 6, 20, 55, 40, 40, 21, 17),
	(44, 18, 50, 75, 17, 14, 10, 18);


	DELIMITER ;

	DROP PROCEDURE IF EXISTS catched_to_team;

	DELIMITER //

	CREATE PROCEDURE catched_to_team (
		IN id_poke INT UNSIGNED)
	BEGIN
	INSERT INTO team (id_pokenti) VALUES (
		id_poke );

	DELETE FROM catched  WHERE id_pokenti=id_poke LIMIT 1;

	END //

	DELIMITER ;

	DROP PROCEDURE IF EXISTS team_to_catched;

	DELIMITER //

	CREATE PROCEDURE team_to_catched (
		IN id_poke INT UNSIGNED )
	BEGIN
	INSERT INTO catched (id_pokenti) VALUES (
		id_poke);

	DELETE FROM team WHERE id_pokenti=id_poke LIMIT 1;

	END //

	DELIMITER ;

	DROP PROCEDURE IF EXISTS heal;

	DELIMITER //

	CREATE PROCEDURE heal (
		IN heal INT,
		IN in_pokenti INT UNSIGNED )
	BEGIN

	SELECT hp INTO @max_hp FROM stats WHERE id_pokenti=in_pokenti;
	SELECT curr_hp INTO @curr_hp FROM current_stats WHERE id_pokenti=in_pokenti;

	IF @curr_hp+heal>@max_hp THEN
		UPDATE current_stats SET curr_hp=@max_hp WHERE id_pokenti=in_pokenti;
	ELSE
		UPDATE current_stats SET curr_hp=@curr_hp+heal WHERE id_pokenti=in_pokenti;
	END IF;

	END //

	DELIMITER ;
