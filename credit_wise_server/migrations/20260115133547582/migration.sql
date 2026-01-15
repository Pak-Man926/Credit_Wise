BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "auth_user" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "auth_user" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "secondName" text NOT NULL,
    "lastName" text NOT NULL,
    "email" text NOT NULL,
    "phoneNumber" bigint NOT NULL,
    "password" text NOT NULL,
    "gender" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_session_log" ADD COLUMN "userId" text;

--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20260115133547582', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260115133547582', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
