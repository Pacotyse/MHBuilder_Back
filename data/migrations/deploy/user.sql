-- Creating table User with their constraint

BEGIN;

CREATE TABLE "user" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "pseudo" TEXT NOT NULL UNIQUE,
    "image" TEXT,
    "id_steam" TEXT,
    "id_playstation" TEXT,
    "id_xbox" TEXT,
    "id_switch" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMPTZ
);

INSERT INTO "user" ("email", "password", "pseudo", "image", "id_steam", "id_playstation", "id_xbox", "id_switch") 
VALUES 
('user1@example.com', 'password1', 'user1', 'https://example.com/user1.jpg', NULL, 'user1_playstation_id', NULL, NULL),
('user2@example.com', 'password2', 'user2', 'https://example.com/user2.jpg', 'user2_steam_id', NULL, NULL, NULL),
('user3@example.com', 'password3', 'user3', 'https://example.com/user3.jpg', NULL, NULL, 'user3_xbox_id', NULL);

COMMIT;
