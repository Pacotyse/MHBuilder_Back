-- Revert mhbuilder:User from pg

BEGIN;

DROP TABLE "user";

COMMIT;
