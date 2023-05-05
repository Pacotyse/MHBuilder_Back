-- Deploy mhbuilder:loadout to pg

BEGIN;

CREATE TABLE "loadout" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT,
    "weapon_id" INTEGER NOT NULL REFERENCES "weapon"("id"),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "loadout_has_armor" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "loadout_id" INTEGER REFERENCES "loadout"("id"),
    "armor_id" INTEGER REFERENCES "armor"("id") 
);

INSERT INTO "loadout" ("name", "description", "weapon_id", "created_at")
VALUES 
('My Loadout 1', 'This is my personal loadout 1.', 1, now()),
('My Loadout 2', 'This is my personal loadout 2.', 2, now()),
('My Loadout 3', 'This is my personal loadout 3.', 3, now());

INSERT INTO "loadout_has_armor" ("loadout_id", "armor_id")
VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 1), (3, 3), (3, 5), (3, 7), (3, 9);

-- CREATE VIEW loadout_data AS 
-- SELECT 
--   loadout.id, 
--   loadout.name,
--   loadout.description,
--   json_build_object(
--       'id', weapon_data.id,
--       'type', weapon_data.type,
--       'name', weapon_data.name,
--       'rarity', weapon_data.rarity,
--       'affinity', weapon_data.affinity,
--       'defense_bonus', weapon_data.defense_bonus,
--       'secret_effect', weapon_data.secret_effect,
--       'sharpness', weapon_data.sharpness,
--       'element', weapon_data.element
--   ) AS weapon
-- FROM loadout
-- JOIN weapon_data ON loadout.weapon_id = weapon_data.id;

COMMIT;
