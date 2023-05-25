-- Revert mhbuilder:loadout from pg

BEGIN;

DROP VIEW IF EXISTS "loadout_data";
DROP TABLE IF EXISTS "loadout_has_armor";
DROP TABLE IF EXISTS "loadout";

COMMIT;
