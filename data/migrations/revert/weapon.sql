-- Revert mhbuilder:weapon from pg

BEGIN;

DROP VIEW IF EXISTS "weapon_data";
DROP TABLE IF EXISTS "weapon";

COMMIT;
