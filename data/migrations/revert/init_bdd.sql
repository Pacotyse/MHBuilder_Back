-- Revert mhbuilder:init_bdd from pg

BEGIN;

DROP TABLE IF EXISTS "loadout_has_armor";
DROP TABLE IF EXISTS "loadout";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "effect";
DROP TABLE IF EXISTS "armor_has_skill";
DROP TABLE IF EXISTS "skill";
DROP TABLE IF EXISTS "armor";
DROP TABLE IF EXISTS "armor_set";
DROP TABLE IF EXISTS "weapon_has_element";
DROP TABLE IF EXISTS "element";
DROP TABLE IF EXISTS "weapon";

COMMIT;

