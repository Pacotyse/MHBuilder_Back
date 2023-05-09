-- Revert mhbuilder:skill from pg

BEGIN;

DROP VIEW skill_data;
DROP TABLE IF EXISTS effect;
DROP TABLE IF EXISTS skill;

COMMIT;
