-- Verify mhbuilder:init_bdd on pg

BEGIN;

SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'WEAPON');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ELEMENT');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'WEAPON_HAS_ELEMENT');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ARMOR_SET');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ARMOR');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'SKILL');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'ARMOR_HAS_SKILL');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'EFFECT');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'USER');
SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'LOADOUT');

COMMIT;
