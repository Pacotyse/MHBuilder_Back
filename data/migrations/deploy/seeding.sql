-- Deploy mhbuilder:seeding to pg

BEGIN;

-- Insertion des données dans la table "weapon"
INSERT INTO "weapon" ("name", "rarity", "affinity", "defense_bonus", "secret_effect", "sharpness_red", "sharpness_orange", "sharpness_yellow", "sharpness_green", "sharpness_blue", "sharpness_white", "sharpness_purple") 
VALUES ('Great Sword', 5, -30, 0, NULL, 50, NULL, NULL, 25, 20, 15, 10),
('Long Sword', 4, 0, 0, 'Spirit Gauge', 35, 15, NULL, 15, 20, 30, 15),
('Hammer', 4, 0, 0, 'Stun', 40, NULL, NULL, 20, 15, 10, NULL),
('Bow', 4, 20, 0, 'Coatings', NULL, 30, 20, NULL, NULL, 40, NULL),
('Switch Axe', 6, -10, 0, 'Switch', 35, NULL, 25, NULL, NULL, 40, NULL);


-- Insertion des données dans la table "element"
INSERT INTO "element" ("name")
VALUES ('Fire'), ('Water'), ('Thunder'), ('Ice'), ('Dragon');

-- Insertion des données dans la table "weapon_has_element"
INSERT INTO "weapon_has_element" ("weapon_id", "element_id", "value")
VALUES (1, 1, 200), (1, 2, 150), (2, 3, 93), (4, 4, 250);

-- Insertion des données dans la table "armor"
INSERT INTO "armor" ("name", "type", "rarity", "defense", "resistance_fire", "resistance_water", "resistance_thunder", "resistance_ice", "resistance_dragon")
VALUES ('Rathalos Helm', 'Head', 5, 78, 3, -2, 0, 0, -1),
       ('Rathalos Mail', 'Chest', 5, 84, 3, -2, 0, 0, -1),
       ('Rathalos Braces', 'Arms', 5, 78, 3, -2, 0, 0, -1),
       ('Rathalos Coil', 'Waist', 5, 84, 3, -2, 0, 0, -1),
       ('Rathalos Greaves', 'Legs', 5, 78, 3, -2, 0, 0, -1);

-- Insertion des données dans la table "skill"
INSERT INTO "skill" ("name", "description", "level_max", "color")
VALUES ('Critical Eye', 'Increases affinity.', 7, 'Red'), ('Attack Boost', 'Increases attack power.', 7, 'Orange');

-- Insertion des données dans la table "armor_has_skill"
INSERT INTO "armor_has_skill" ("armor_id", "skill_id", "level")
VALUES (1, 1, 1), (1, 2, 3), (2, 2, 1), (3, 1, 2), (4, 2, 2), (5, 1, 1);

-- Insertion des données dans la table "effect"
INSERT INTO "effect" ("skill_id", "level", "description", "modifier_1", "modifier_2", "modifier_3")
VALUES 
(1, 1,'Increases affinity by 3%.', 3, NULL, NULL), 
(1, 2,'Increases affinity by 6%.', 6, NULL, NULL),  
(1, 3,'Increases affinity by 9%.', 9, NULL, NULL),
(1, 4,'Increases affinity by 12%.', 12, NULL, NULL),
(1, 5,'Increases affinity by 15%.', 15, NULL, NULL),
(1, 6,'Increases affinity by 20%.', 20, NULL, NULL),
(1, 7,'Increases affinity by 25%.', 25, NULL, NULL),
(2, 1,'Increases attack power by 5.', 5, NULL, NULL),
(2, 2,'Increases attack power by 10.', 10, NULL, NULL),
(2, 3,'Increases attack power by 15.', 15, NULL, NULL),
(2, 4,'Increases attack power by 20.', 20, NULL, NULL),
(2, 5,'Increases attack power by 25.', 25, NULL, NULL),
(2, 6,'Increases attack power by 30.', 30, NULL, NULL),
(2, 7,'Increases attack power by 40.', 40, NULL, NULL);

-- Insertion des données dans la table "user"
INSERT INTO "user" ("email", "sword", "pseudo", "image", "id_steam", "id_playstation", "id_xbox", "id_switch")
VALUES ('test@test.com', 'longsword', 'TestUser', NULL, NULL, NULL, NULL, NULL);

-- Insertion des données dans la table "loadout"
INSERT INTO "loadout" ("user_id", "name", "description", "weapon_id", "created_at")
VALUES (1, 'Test Loadout', 'This is a test loadout.', 1, now());

-- Insertion des données dans la table "loadout_has_armor"
INSERT INTO "loadout_has_armor" ("loadout_id", "armor_id")
VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5);


COMMIT;
