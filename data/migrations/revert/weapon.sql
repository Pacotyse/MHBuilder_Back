-- Revert mhbuilder:weapon from pg

BEGIN;

DROP TABLE IF EXISTS "weapon";

COMMIT;
