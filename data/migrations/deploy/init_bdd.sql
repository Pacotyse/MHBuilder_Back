-- Deploy mhbuilder:init_bdd to pg

BEGIN;

CREATE TABLE "weapon" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "rarity" INTEGER NOT NULL DEFAULT 1,
    "affinity" INTEGER NOT NULL DEFAULT 0,
    "defense_bonus" INTEGER NOT NULL DEFAULT 0,
    "secret_effect" TEXT,
    "sharpness_red" INTEGER NOT NULL,
    "sharpness_orange" INTEGER,
    "sharpness_yellow" INTEGER,
    "sharpness_green" INTEGER,
    "sharpness_blue" INTEGER,
    "sharpness_white" INTEGER,
    "sharpness_purple" INTEGER
);

CREATE TABLE "element" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "weapon_has_element" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "weapon_id" INTEGER REFERENCES "weapon"("id"),
    "element_id" INTEGER REFERENCES "element"("id"),
    "value" INTEGER NOT NULL
);

CREATE TABLE "armor" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "rarity" INTEGER NOT NULL DEFAULT 1,
    "defense" INTEGER NOT NULL,
    "resistance_fire" INTEGER NOT NULL DEFAULT 0,
    "resistance_water" INTEGER NOT NULL DEFAULT 0,
    "resistance_thunder" INTEGER NOT NULL DEFAULT 0,
    "resistance_ice" INTEGER NOT NULL DEFAULT 0,
    "resistance_dragon" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "skill" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT NOT NULL,
    "level_max" INTEGER NOT NULL DEFAULT(1),
    "color" TEXT NOT NULL
);

CREATE TABLE "armor_has_skill" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "armor_id" INTEGER REFERENCES "armor"("id"),
    "skill_id" INTEGER REFERENCES "skill"("id"),
    "level" INTEGER DEFAULT(1)
);

CREATE TABLE "effect" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "skill_id" INTEGER REFERENCES "skill"("id"),
    "level" INTEGER,
    "description" TEXT NOT NULL,
    "modifier_1" INTEGER,
    "modifier_2" INTEGER,
    "modifier_3" INTEGER
);

CREATE TABLE "user" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "email" TEXT NOT NULL UNIQUE,
    "sword" TEXT NOT NULL,
    "pseudo" TEXT NOT NULL UNIQUE,
    "image" TEXT,
    "id_steam" TEXT,
    "id_playstation" TEXT,
    "id_xbox" TEXT,
    "id_switch" TEXT
);

CREATE TABLE "loadout" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "user_id" INTEGER REFERENCES "user"("id"),
    "name" TEXT NOT NULL,
    "description" TEXT,
    "weapon_id" INTEGER REFERENCES "weapon"("id"),
    "created_at" TIMESTAMPTZ
);

CREATE TABLE "loadout_has_armor" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "loadout_id" INTEGER REFERENCES "loadout"("id"),
    "armor_id" INTEGER REFERENCES "armor"("id")
);

COMMIT;
