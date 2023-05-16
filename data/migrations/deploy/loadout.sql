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
	"arms_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"waist_id" INTEGER NOT NULL REFERENCES "armor"("id"),
	"legs_id" INTEGER NOT NULL REFERENCES "armor"("id"),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMPTZ
);


INSERT INTO "loadout" ("name", "description", "user_id", "weapon_id", "head_id", "chest_id", "arms_id", "waist_id", "legs_id") VALUES
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
  ) AS weapon,
  json_build_object(
      'id', head_armor.id,
      'type', head_armor.type,
      'name', head_armor.name,
      'rarity', head_armor.rarity,
	  'defense', head_armor.defense,
	  'resistances', head_armor.resistances,
	  'skills', head_armor.skills
  ) AS head,
  json_build_object(
      'id', chest_armor.id,
      'type', chest_armor.type,
      'name', chest_armor.name,
      'rarity', chest_armor.rarity,
	  'defense', chest_armor.defense,
	  'resistances', chest_armor.resistances,
	  'skills', chest_armor.skills
  ) AS chest,
  json_build_object(
      'id', arms_armor.id,
      'type', arms_armor.type,
      'name', arms_armor.name,
      'rarity', arms_armor.rarity,
	  'defense', arms_armor.defense,
	  'resistances', arms_armor.resistances,
	  'skills', arms_armor.skills
  ) AS arms,
  json_build_object(
      'id', waist_armor.id,
      'type', waist_armor.type,
      'name', waist_armor.name,
      'rarity', waist_armor.rarity,
	  'defense', waist_armor.defense,
	  'resistances', waist_armor.resistances,
	  'skills', waist_armor.skills
  ) AS waist,
  json_build_object(
      'id', legs_armor.id,
      'type', legs_armor.type,
      'name', legs_armor.name,
      'rarity', legs_armor.rarity,
	  'defense', legs_armor.defense,
	  'resistances', legs_armor.resistances,
	  'skills', legs_armor.skills
  ) AS legs
FROM loadout
JOIN weapon_data ON loadout.weapon_id = weapon_data.id
JOIN armor_data AS head_armor ON loadout.head_id = head_armor.id
JOIN armor_data AS chest_armor ON loadout.chest_id = chest_armor.id
JOIN armor_data AS arms_armor ON loadout.arms_id = arms_armor.id
JOIN armor_data AS waist_armor ON loadout.waist_id = waist_armor.id
JOIN armor_data AS legs_armor ON loadout.legs_id = legs_armor.id;


COMMIT;
