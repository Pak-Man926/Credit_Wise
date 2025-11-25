BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "auth_user" (
    "id" bigserial PRIMARY KEY,
    "fisrtName" text NOT NULL,
    "secondName" text NOT NULL,
    "lastName" text NOT NULL,
    "email" text NOT NULL,
    "phoneNumber" bigint NOT NULL,
    "password" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20251125071120167', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251125071120167', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
