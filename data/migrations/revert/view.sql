-- Revert mhbuilder:view from pg

BEGIN;

DROP VIEW IF EXISTS loadout_with_armor;
DROP VIEW IF EXISTS weapon_with_element;
DROP VIEW IF EXISTS armor_with_skill;

COMMIT;
