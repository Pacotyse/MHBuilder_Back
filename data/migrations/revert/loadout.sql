-- Revert mhbuilder:loadout from pg

BEGIN;

-- Supprimer la contrainte de clé étrangère
ALTER TABLE loadout DROP CONSTRAINT IF EXISTS loadout_user_id_fkey;

-- Supprimer la vue loadout_data
DROP VIEW IF EXISTS "loadout_data";

-- Supprimer la table loadout_has_armor
DROP TABLE IF EXISTS "loadout_has_armor";

-- Supprimer la table loadout
DROP TABLE IF EXISTS "loadout";

COMMIT;
