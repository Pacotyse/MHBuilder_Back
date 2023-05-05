-- Revert mhbuilder:decoration from pg

BEGIN;

DROP TABLE IF EXISTS decoration;

COMMIT;
