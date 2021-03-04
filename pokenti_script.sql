/*SCRIPT PARA INICIAR LA BASE DE DATOS POKENTI*/

DROP TABLE IF EXISTS levels;
DROP TABLE IF EXISTS evolves_level;
DROP TABLE IF EXISTS evolves;

DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS pokentis_types;

DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS catched;

DROP TABLE IF EXISTS current_stats;

DROP TABLE IF EXISTS pokentis_players;

DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS pokentis;

CREATE TABLE pokentis (
	id_pokenti INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(24) NOT NULL,
	japanese_name VARCHAR(24),
	poke_number INT NOT NULL );

INSERT INTO pokentis (name, japanese_name, poke_number) VALUES (
	('Bulbasaur', 'フシギダネ', 1),
	('Ivysaur', 'フシギソウ', 2),
	('Venusaur', 'フシギバナ', 3),
	('Charmander', 'ヒトカゲ', 4),
	('Charmaleon','リザード',5),
	('Charizard','リザードン',6),
	('Squirtle','ゼニガメ',7),
	('Wartortle','	カメール',8),
	('Blastoise','カメックス',9),
	('Caterpie','キャタピー',10),
	('Metapod','トランセル',11),
	('Butterfree','	バタフリー',12),
	('Weedle','ビードル',13),
	('Kakuna','コクーン',14),
	('Beedrill','	スピアー',15),
	('Pidgey','ポッポ',16);
	('Pidgeotto','ピジョン',17),
	('Pidgeot','ピジョット',18),
	('Rattata','コラッタ',19),
	('Raticate','ラッタ',20);

CREATE TABLE evolves (
	id_evolve INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pre-evolve VARCHAR(24) NOT NULL,
	evolve VARCHAR(24) NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO evolves (pre-evolve, evolve, id_pokenti) VALUES (
	('Huevo', 'Ivysaur', 1),
	('Bulbasaur', 'Venusaur', 2),
	('Ivysaur', '', 3),
	('Huevo', 'Charmeleon', 4),
	('Charmander', 'Charizard', 5),
	('Charmeleon', '', 6),
	('Huevo', 'Wartortle', 7),
	('Squirtle', 'Blastoise', 8),
	('Wartortle', '', 9),
	('Huevo', 'Metapod', 10),
	('Caterpie', 'Butterfree', 11),
	('Metapod', '', 12),
	('Huevo', 'Kakuna', 13),
	('Weedle', 'Beedrill', 14),
	('Kakuna', '', 15),
	('Huevo', 'Pidgeotto', 16),
	('Pidgey', 'Pidgeot', 17),
	('Pidgeotto', '', 18),
	('Huevo', 'Raticate', 19),
	('Rattata', '', 20) );

CREATE TABLE levels (
	id_level INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_evolution_level INT,
	second_evolution_level INT,
	third_evolution_level INT );

INSERT INTO levels (level_evolve) VALUES (
	(16, 32, null),
	(7, 10, null),
	(18, 36, null),
	(20, null) );
	
CREATE TABLE evolves_level (
	id_evolve_level INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_evolve INT UNSIGNED,
	id_level INT UNSIGNED
	FOREIGN KEY (id_evolve) REFERENCES evolves(id_evolve),
	FOREING KEY (id_level) REFERENCES levels(id_level) );

INSERT INTO evolves_level (id_evolve, id_level) VALUES (
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 3),
	(17, 3),
	(18, 3),
	(19, 4),
	(20, 4) );

CREATE TABLE types (
	id_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	primary VARCHAR(16) NOT NULL,
	secondary VARCHAR(16) NOT NULL );

INSERT INTO types (primary, secondary) VALUES (
	('Grass', 'Poison'),
	('Fire', NULL),
	('Fire', 'Dragon'),
	('Water', NULL),
	('Bug', NULL),
	('Bug', 'Fliyng'),
	('Bug', 'Poison'),
	('Normal', 'Flying'),
	('Normal', NULL) );

CREATE TABLE pokentis_types (
	id_pokenti_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_pokenti INT UNSIGNED NOT NULL,
	id_type INT UNSIGNED NOT NULL,
	FOREING KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	FOREING KEY (id_type) REFERENCES types(id_type) );

INSERT INTO pokentis_types (id_pokenti, id_type) VALUES (
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
	(18, 8),
	(19, 9),
	(20, 9) );

CREATE TABLE players (
	id_player INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player VARCHAR(24) NOT NULL );

INSERT INTO players (player) VALUES (
	('Ash'),
	('Misty'),
	('Brock') );

CREATE TABLE players_pokentis (
	id_players_pokentis INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_player INT UNSIGNED NOT NULL 
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	FOREIGN KEY (id_player) REFERENCES players(id_player) );

INSERT INTO players_pokentis (id_player, id_pokentis) VALUES (
	(1, 7),
	(1, 10),
	(1, 16),
	(2, 1),
	(2, 12),
	(3, 4),
	(3, 19) );

CREATE TABLE stats (
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hp INT NOT NULL,
	attack INT NOT NULL,
	defense INT NOT NULL,
	sp_atk INT NOT NULL,
	sp_def INT NOT NULL,
	speed INT NOT NULL,
	total INT NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO stats (hp, attack, defense, sp_atk, sp_def, speed, total, id_pokenti) VALUES (
	(45, 49, 49, 65, 65, 45, 318, 1),
	(60, 62, 63, 80, 80, 60, 405, 2),
	(80, 82, 83, 100, 100, 80, 525, 3),
	(39, 52, 43, 60, 50, 65, 309, 4),
	(58, 64, 58, 80, 65, 80, 405, 5),
	(78, 84, 78, 109, 85, 100, 543, 6),
	(44, 48, 65, 50, 64, 43, 324, 7),
	(59, 63, 80, 65, 80, 58, 405, 8),
	(79, 83, 100, 85, 105, 78, 530, 9),
	(45, 30, 35, 20, 20, 45, 195, 10),
	(50, 20, 55, 25, 25, 30, 205, 11),
	(60, 45, 50, 90, 80, 70, 395, 12),
	(40, 35, 30, 20, 20, 50, 195, 13),
	(45, 25, 50, 25, 25, 35, 205, 14),
	(65, 90, 40, 45, 80, 75, 395, 15),
	(40, 45, 40, 35, 35, 56, 251, 16),
	(63, 60, 55, 50, 50, 71, 349, 17),
	(83, 80, 75, 70, 70, 101, 479, 18),
	(30, 56, 35, 25, 35, 72, 253, 19),
	(55, 81, 60, 50, 70, 97, 413, 20) );

CREATE TABLE current_stats (
	id_current_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	curr_level INT NOT NULL,
	curr_exp INT NOT NULL,
	curr_hp INT NOT NULL,
	curr_attack INT NOT NULL,
	curr_defense INT NOT NULL,
	curr_sp_atk INT NOT NULL,
	curr_sp_def INT NOT NULL,
	curr_speed INT NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO current_stats (curr_level, curr_exp, curr_hp, cur_attack, curr_defense, curr_sp_atk, curr_sp_def, curr_speed, id_pokenti) VALUES (
	(5, 34, 41, 42, 65, 15, 15, 31, 1),
	(20, 26, 6, 43, 80, 8, 6, 45, 2),
	(50, 8, 18, 56, 10, 10, 38, 55, 3),
	(6, 13, 2, 32, 60, 35, 45, 39, 4),
	(23, 75, 61, 18, 8, 15, 18, 45, 5),
	(40, 47, 54, 48, 19, 18, 10, 43, 6),
	(2, 42, 41, 35, 50, 6, 43, 24, 7),
	(17, 51, 73, 20, 35, 10, 58, 14, 8),
	(36, 7, 81, 60, 15, 15, 78, 20, 9),
	(9, 41, 30, 31, 10, 20, 45, 15, 10),
	(15, 45, 10, 45, 45, 25, 30, 5, 11),
	(28, 76, 45, 40, 14, 30, 70, 45, 12),
	(4, 43, 35, 20, 24, 20, 50, 19, 13),
	(12, 14, 25, 12, 15, 2, 35, 45, 14),
	(30, 86, 10, 14, 40, 40, 75, 15, 15),
	(6, 42, 5, 40, 32, 32, 53, 25, 16),
	(25, 6, 20, 55, 40, 40, 21, 39, 17),
	(70, 18, 50, 75, 17, 14, 10, 79, 18),
	(1, 34, 16, 35, 22, 25, 12, 53, 19),
	(35, 51, 11, 60, 15, 40, 9, 41, 20) );

CREATE TABLE catched (
	id_catched INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_player INT UNSIGNED NOT NULL,
	id_pokenti INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_player) REFERENCES players(id_player),
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti) );

INSERT INTO catched (id_player, id_pokenti) VALUES (
	(1, 11),
	(1, 17),
	(2, 13),
	(2, 16),
	(3, 11),
	(3, 13) );

DELIMITER ;

DROP PROCEDURE IF EXISTS catched_to_list;

DELIMITER //

CREATE PROCEDURE catched_to_list ( 
	IN in_id_player INT UNSIGNED,
	IN in_id_pokenti INT UNSIGNED ) 
BEGIN
INSERT INTO players_pokenti(id_player, id_pokenti) VALUES (
	in_id_player, 
	in_id_pokenti);

DELETE FROM catched  WHERE id_player=in_id_player 
AND id_pokenti=in_id_pokenti LIMIT 1;

END //

DELIMITER ;

DROP PROCEDURE IF EXISTS list_to_catched;

DELIMITER //

CREATE PROCEDURE list_to_catched (
	IN in_id_player INT UNSIGNED,
	IN in_id_pokenti INT UNSIGNED )
BEGIN 
INSERT INTO catched (id_player, id_pokenti) VALUES (
	in_id_player,
	in_id_pokenti);

DELETE FROM players_pokenti WHERE id_player=in_id_player 
AND id_pokenti=in_id_pokenti LIMIT 1;

END //

DELIMITER ;

DROP PROCEDURE IF EXISTS heal;

DELIMITER //

CREATE PROCEDURE heal (
	IN in_heal INT,
	IN in_pokenti INT UNSIGNED,
	IN in_player INT UNSIGNED )
BEGIN 
SELECT curr_hp INTO @curr_hp FROM current_stats WHERE id_pokenti=in_pokenti 
INNER JOIN players_pokentis ON id_player=in_player 
ORDER BY id_pokenti_player DESC LIMIT 1; 
SET @heal:= @curr_hp + in_heal; 
UPDATE current_stats SET curr_hp=@heal WHERE id_pokenti=in_pokenti;
END //

DELIMITER ;

















