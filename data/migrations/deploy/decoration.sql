-- Deploy mhbuilder:decoration to pg

BEGIN;

CREATE TABLE "decoration" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL,
    "rank" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,
    "level" INTEGER NOT NULL DEFAULT 1
);

-- INSERT INTO "decoration" ("name", "rank", "skill_id", "level") VALUES
-- ('Expert Jewel 1', 1, 1, 1),
-- ('Expert Jewel 2', 2, 1, 1),
-- ('Expert Jewel 3', 3, 1, 1),
-- ('Tenderizer Jewel 2', 2, 2, 1),
-- ('Agitator Jewel 1', 1, 3, 1),
-- ('Agitator Jewel 2', 2, 3, 1),
-- ('Agitator Jewel 3', 3, 3, 1);

COMMIT;
