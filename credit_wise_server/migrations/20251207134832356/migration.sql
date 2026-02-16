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
    "gender" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20251207134832356', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251207134832356', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
