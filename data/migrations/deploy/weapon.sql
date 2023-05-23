-- Deploy mhbuilder:weapon to pg

BEGIN;

CREATE TABLE "weapon" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    "rarity" INTEGER NOT NULL DEFAULT 1,
    "attack" INTEGER NOT NULL,
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
    "sharpness_inactiv" INTEGER NOT NULL DEFAULT 50
);

-- INSERT INTO "weapon" ("type", "name", "rarity", "attack", "affinity", "defense_bonus", "secret_effect", "sharpness_red", "sharpness_orange", "sharpness_yellow", "sharpness_green", "sharpness_blue", "sharpness_white", "sharpness_purple") 
-- VALUES 
-- ('great_sword', 'Wyvern Jawblade', 8, 220, -20, 0, 'None', 48, 20, null, null, null, null, null),
-- ('great_sword', 'Anguish', 8, 240,0, 0, 'None', 50, 30, null, null, null, null, null),
-- ('long_sword', 'Divine Slasher', 8, 180, 0, 0, 'None', 20, 20, 10, null, null, null, null),
-- ('long_sword', 'Reaver Calamity', 8, 170, 0, 0, 'None', 40, 30, 20, null, null, null, null),
-- ('sword_and_shield', 'Master Bang', 8, 120, 0, 0, 'None', 12, 20, null, null, null, null, null),
-- ('sword_and_shield', 'Teostra Emblem', 8, 110, 0, 0, 'None', 20, 15, null, null, null, null, null);

CREATE TABLE "element" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,

);

-- INSERT INTO "element" ("name")
-- VALUES
-- ('fire'),
-- ('water'),
-- ('thunder'),
-- ('ice'),
-- ('dragon'),
-- ('blast'),
-- ('poison'),
-- ('paralysis'),
-- ('sleep');

CREATE TABLE "weapon_has_element" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "weapon_id" INTEGER NOT NULL REFERENCES "weapon"("id"),
    "element_id" INTEGER NOT NULL REFERENCES "element"("id"),
    "value" INTEGER NOT NULL,
    "phiale" BOOLEAN NOT NULL DEFAULT false
);

-- INSERT INTO "weapon_has_element" ("weapon_id", "element_id", "value")
-- VALUES
-- (1, 1, 80),
-- (2, 3, 95),
-- (3, 4, 45),
-- (3, 6, 32),
-- (4, 9, 47);

CREATE VIEW weapon_data AS 
SELECT 
weapon.id, 
weapon.type, 
CONCAT(weapon.type, '_', weapon.rarity) AS icon,
weapon.name, 
weapon.rarity,
weapon.attack,
weapon.affinity,
json_agg(
    json_build_object(
        'name', element.name, 
		'value', weapon_has_element.value
    )
) AS element,
json_build_object(
    'red', weapon.sharpness_red,
    'orange', weapon.sharpness_orange,
    'yellow', weapon.sharpness_yellow,
    'green', weapon.sharpness_green,
    'blue', weapon.sharpness_blue,
    'white', weapon.sharpness_white,
    'purple', weapon.sharpness_purple,
    'inactiv', weapon.sharpness_inactiv
) AS sharpness,
weapon.defense_bonus, 
weapon.secret_effect
FROM weapon 
JOIN weapon_has_element ON weapon.id = weapon_has_element.weapon_id
JOIN element ON element.id = weapon_has_element.element_id
GROUP BY weapon.id;


COMMIT;