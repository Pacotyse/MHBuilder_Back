-- Deploy mhbuilder:armor to pg

BEGIN;

CREATE TABLE "armor" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    "rarity" INTEGER NOT NULL DEFAULT 1,
    "defense" INTEGER NOT NULL,
    "resistance_fire" INTEGER NOT NULL DEFAULT 0,
    "resistance_water" INTEGER NOT NULL DEFAULT 0,
    "resistance_thunder" INTEGER NOT NULL DEFAULT 0,
    "resistance_ice" INTEGER NOT NULL DEFAULT 0,
    "resistance_dragon" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "armor_has_skill" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "armor_id" INTEGER REFERENCES "armor"("id"),
    "skill_id" INTEGER REFERENCES "skill"("id"),
    "level" INTEGER DEFAULT(1)
);

-- Seeding armor with 2 armor set
INSERT INTO "armor" ("type", "name", "rarity", "defense", "resistance_fire", "resistance_water", "resistance_thunder", "resistance_ice", "resistance_dragon")
VALUES 
('head', 'Rathalos Helm', 5, 78, 3, -2, 0, 0, -1),
('chest', 'Rathalos Mail', 5, 84, 3, -2, 0, 0, -1),
('arms', 'Rathalos Braces', 5, 78, 3, -2, 0, 0, -1),
('waist', 'Rathalos Coil', 5, 84, 3, -2, 0, 0, -1),
('legs', 'Rathalos Greaves', 5, 78, 3, -2, 0, 0, -1),
('head', 'Tigrex Helm', 4, 90, -2, 2, 0, -1, 0),
('chest', 'Tigrex Mail', 4, 96, -2, 2, 0, -1, 0),
('arms', 'Tigrex Vambraces', 4, 90, -2, 2, 0, -1, 0),
('waist', 'Tigrex Coil', 4, 96, -2, 2, 0, -1, 0),
('legs', 'Tigrex Greaves', 4, 90, -2, 2, 0, -1, 0);

-- Seeding armor_has_skill to link skill and armor
INSERT INTO "armor_has_skill" ("armor_id", "skill_id", "level")
VALUES 
(1, 4, 7),
(1, 2, 3), 
(2, 2, 1),
(3, 1, 2),
(4, 2, 2),
(5, 1, 1),
(6, 1, 1), 
(6, 2, 2), 
(7, 1, 1), 
(7, 2, 2), 
(8, 1, 2), 
(9, 1, 1), 
(10, 2, 3), 
(10, 2, 2); 

-- Armor's view with all the specific data from skill and effect
CREATE VIEW armor_data AS 
SELECT 
    armor.id, 
    armor.type, 
    CONCAT(armor.type, '_', armor.rarity) AS icon,
    armor.name, 
    armor.rarity, 
    armor.defense, 
    json_build_object(
        'fire', armor.resistance_fire, 
        'water', armor.resistance_water, 
        'thunder', armor.resistance_thunder, 
        'ice', armor.resistance_ice, 
        'dragon', armor.resistance_dragon) 
    AS resistances,
    json_agg(
        json_build_object(
            'id', skill.id,
            'name', skill.name,
            'description', skill.description,
            'level', armor_has_skill.level,
            'level_max', skill.level_max,
            'effect', effect.description,
			'modifier_filed', effect.modifier_field,
            'modifier_operator', effect.modifier_operator,
            'modifier_value', effect.modifier_value
        )
    ) as skills
FROM armor
JOIN armor_has_skill ON armor_id = armor.id
JOIN skill ON skill.id = armor_has_skill.skill_id
JOIN effect ON skill.id = effect.skill_id AND armor_has_skill.level = effect.level
GROUP BY armor.id;

COMMIT;
