-- Deploy mhbuilder:weapon to pg

BEGIN;

CREATE TABLE "weapon" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    "rarity" INTEGER NOT NULL DEFAULT 1,
    "affinity" INTEGER NOT NULL DEFAULT 0,
    "defense_bonus" INTEGER NOT NULL DEFAULT 0,
    "secret_effect" TEXT,
    "sharpness_red" INTEGER NOT NULL,
    "sharpness_orange" INTEGER,
    "sharpness_yellow" INTEGER,
    "sharpness_green" INTEGER,
    "sharpness_blue" INTEGER,
    "sharpness_white" INTEGER,
    "sharpness_purple" INTEGER,
    "element_fire" INTEGER,
    "element_water" INTEGER,
    "element_thunder" INTEGER,
    "element_ice" INTEGER,
    "element_dragon" INTEGER
);

INSERT INTO "weapon" ("type", "name", "rarity", "affinity", "defense_bonus", "secret_effect", "sharpness_red", "sharpness_orange", "sharpness_yellow", "sharpness_green", "sharpness_blue", "sharpness_white", "sharpness_purple", "element_fire", "element_water", "element_thunder", "element_ice", "element_dragon") VALUES 
('Great Sword', 'Wyvern Jawblade', 8, -20, 0, 'None', 48, 20, null, null, null, null, null, null, null, null, null, null),
('Great Sword', 'Anguish', 8, 0, 0, 'None', 50, 30, null, null, null, null, null, null, null, null, null, null),
('Long Sword', 'Divine Slasher', 8, 0, 0, 'None', 20, 20, 10, null, null, null, null, null, null, null, null, null),
('Long Sword', 'Reaver Calamity', 8, 0, 0, 'None', 40, 30, 20, null, null, null, null, null, null, null, null, null),
('Sword and Shield', 'Master Bang', 8, 0, 0, 'None', 12, 20, null, null, null, null, null, 200, null, null, null, null),
('Sword and Shield', 'Teostra Emblem', 8, 0, 0, 'None', 20, 15, null, null, null, null, null, 240, null, null, null, null);

-- CREATE VIEW weapon_data AS 
-- SELECT weapon.id, 
-- weapon.type, 
-- weapon.name, 
-- weapon.rarity,
-- weapon.affinity, 
-- weapon.defense_bonus, 
-- weapon.secret_effect, 
-- json_build_object(
-- 	'red', weapon.sharpness_red,
-- 	'orange', weapon.sharpness_orange,
-- 	'yellow', weapon.sharpness_yellow,
-- 	'green', weapon.sharpness_green,
-- 	'blue', weapon.sharpness_blue,
-- 	'white', weapon.sharpness_white
-- ) AS sharpness,
-- json_build_object(
-- 	'fire', weapon.element_fire,
-- 	'water', weapon.element_water,
-- 	'thunder', weapon.element_thunder,
-- 	'ice', weapon.element_ice,
-- 	'dragon', weapon.element_dragon
-- ) AS element FROM weapon;



COMMIT;