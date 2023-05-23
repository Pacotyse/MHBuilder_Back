-- Deploy mhbuilder:skill to pg

BEGIN;

CREATE TABLE "skill" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT NOT NULL,
    "level_max" INTEGER NOT NULL DEFAULT(1),
    "color" TEXT NOT NULL
);

CREATE TABLE "effect" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "skill_id" INTEGER REFERENCES "skill"("id"),
    "level" INTEGER,
    "description" TEXT NOT NULL,
    "modifier" JSON
);

-- INSERT INTO "skill" ("name", "description", "level_max", "color") VALUES 
-- ('Critical Eye', 'Increases affinity.', 7, 'blue'),
-- ('Weakness Exploit', 'Increases affinity when attacking monster weak points.', 3, 'purple'),
-- ('Agitator', 'Increases attack and affinity when monster is enraged.', 5, 'red'),
-- ('Attack boost', 'Increses attack', 7, 'red'),
-- ('Fire Resistance', 'Increses fire resistances', 5, 'red');

-- INSERT INTO "effect" ("skill_id", "level", "description","modifier_field", "modifier_operator", "modifier_value") VALUES 
-- (1, 1, 'Increases affinity by 3%.', 'affinity', '+', 3),
-- (1, 2, 'Increases affinity by 6%.', 'affinity', '+', 6),
-- (1, 3, 'Increases affinity by 9%.', 'affinity', '+', 9),
-- (1, 4, 'Increases affinity by 12%.', 'affinity', '+', 12),
-- (1, 5, 'Increases affinity by 15%.', 'affinity', '+', 15),
-- (1, 6, 'Increases affinity by 18%.', 'affinity', '+', 18),
-- (1, 7, 'Increases affinity by 21%.', 'affinity', '+', 21),
-- (2, 1, 'Increases affinity by 15% when attacking a monster weak point.', NULL, NULL, NULL),
-- (2, 2, 'Increases affinity by 30% when attacking a monster weak point.', NULL, NULL, NULL),
-- (2, 3, 'Increases affinity by 50% when attacking a monster weak point.', NULL, NULL, NULL),
-- (3, 1, 'Attack +4 and affinity +3% when monster is enraged.', NULL, NULL, NULL),
-- (3, 2, 'Attack +8 and affinity +6% when monster is enraged.', NULL, NULL, NULL),
-- (3, 3, 'Attack +12 and affinity +9% when monster is enraged.', NULL, NULL, NULL),
-- (3, 4, 'Attack +16 and affinity +12% when monster is enraged.', NULL, NULL, NULL),
-- (3, 5, 'Attack +20 and affinity +15% when monster is enraged.', NULL, NULL, NULL),
-- (4, 1, 'Increases attack by 5.', 'attack', '+', 5),
-- (4, 2, 'Increases attack by 10.', 'attack', '+', 10),
-- (4, 3, 'Increases attack by 15.', 'attack', '+', 15),
-- (4, 4, 'Increases attack by 20.', 'attack', '+', 20),
-- (4, 5, 'Increases attack by 25.', 'attack', '+', 25),
-- (4, 6, 'Increases attack by 30.', 'attack', '+', 30),
-- (4, 7, 'Increases attack by 40.', 'attack', '+', 40),
-- (5, 1, 'Increades fire resistance by 5', 'resistances.fire', '+', 5),
-- (5, 2, 'Increades fire resistance by 10', 'resistances.fire', '+', 10),
-- (5, 3, 'Increades fire resistance by 15', 'resistances.fire', '+', 15),
-- (5, 4, 'Increades fire resistance by 20', 'resistances.fire', '+', 20),
-- (5, 5, 'Increades fire resistance by 25', 'resistances.fire', '+', 25);

CREATE VIEW skill_data AS
SELECT 
skill.id,
skill.name,
skill.description AS skill_description,
skill.color,
effect.level,
skill.level_max,
effect.description AS effect_description,
effect.modifier
FROM skill
JOIN effect ON effect.skill_id = skill.id;

COMMIT;
