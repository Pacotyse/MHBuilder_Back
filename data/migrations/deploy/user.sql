-- Creating table User with their constraint

BEGIN;

CREATE TABLE "user" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMPTZ
);

INSERT INTO "user" ("email", "password", "username") 
VALUES 
('user1@example.com', 'password1', 'user1'),
('user2@example.com', 'password2', 'user2'),
('user3@example.com', 'password3', 'user3');

COMMIT;
