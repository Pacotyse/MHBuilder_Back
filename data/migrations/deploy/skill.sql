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
    "modifier_1" INTEGER DEFAULT NULL,
    "modifier_2" INTEGER DEFAULT NULL,
    "modifier_3" INTEGER DEFAULT NULL
);

INSERT INTO "skill" ("name", "description", "level_max", "color") VALUES 
('Critical Eye', 'Increases affinity.', 7, 'blue'),
('Weakness Exploit', 'Increases affinity when attacking monster weak points.', 3, 'purple'),
('Agitator', 'Increases attack and affinity when monster is enraged.', 5, 'red');

INSERT INTO "effect" ("skill_id", "level", "description") VALUES 
(1, 1, 'Increases affinity by 3%.'),
(1, 2, 'Increases affinity by 6%.'),
(1, 3, 'Increases affinity by 9%.'),
(1, 4, 'Increases affinity by 12%.'),
(1, 5, 'Increases affinity by 15%.'),
(1, 6, 'Increases affinity by 18%.'),
(1, 7, 'Increases affinity by 21%.'),
(2, 1, 'Increases affinity by 15% when attacking a monster weak point.'),
(2, 2, 'Increases affinity by 30% when attacking a monster weak point.'),
(2, 3, 'Increases affinity by 50% when attacking a monster weak point.'),
(3, 1, 'Attack +4 and affinity +3% when monster is enraged.'),
(3, 2, 'Attack +8 and affinity +6% when monster is enraged.'),
(3, 3, 'Attack +12 and affinity +9% when monster is enraged.'),
(3, 4, 'Attack +16 and affinity +12% when monster is enraged.'),
(3, 5, 'Attack +20 and affinity +15% when monster is enraged.');

CREATE VIEW skill_data AS
SELECT 
skill.id,
skill.name,
skill.description,
json_agg(
	json_build_object(
		'level', effect.level,
		'description', effect.description
	)
) AS effect,
skill.color
FROM skill
JOIN effect ON skill.id = skill_id
GROUP BY skill.id;

COMMIT;
