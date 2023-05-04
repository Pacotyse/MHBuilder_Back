-- Revert mhbuilder:skill from pg

BEGIN;

DROP TABLE IF EXISTS effect;
DROP TABLE IF EXISTS skill;

COMMIT;
