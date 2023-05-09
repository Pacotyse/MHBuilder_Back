-- Deploy mhbuilder:loadout to pg

BEGIN;

CREATE TABLE "loadout" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT,
    "user_id" INTEGER NOT NULL REFERENCES "user"("id"),
    "weapon_id" INTEGER NOT NULL REFERENCES "weapon"("id"),
	"head_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"chest_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"arm_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"belt_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"leg_id" INTEGER NOT NULL REFERENCES "armor"("id"),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMPTZ
);


INSERT INTO "loadout" ("name", "description", "user_id", "weapon_id", "head_id", "chest_id", "arm_id", "belt_id", "leg_id") VALUES
('Loadout 1', 'Description of loadout 1', 1, 1, 2, 3, 4, 5, 6),
('Loadout 2', 'Description of loadout 2', 2, 2, 4, 3, 2, 1, 5);

CREATE VIEW loadout_data AS 
SELECT 
  loadout.id, 
  loadout.name,
  loadout.description,
  json_build_object(
      'id', weapon_data.id,
      'type', weapon_data.type,
      'name', weapon_data.name,
      'rarity', weapon_data.rarity,
      'affinity', weapon_data.affinity,
      'defense_bonus', weapon_data.defense_bonus,
      'secret_effect', weapon_data.secret_effect,
      'sharpness', weapon_data.sharpness,
      'element', weapon_data.element
  ) AS weapon
FROM loadout
JOIN weapon_data ON loadout.weapon_id = weapon_data.id;

COMMIT;
