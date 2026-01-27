BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "credit_preference" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "credit_preference" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "creditUsage" double precision NOT NULL,
    "latePayment3059" bigint NOT NULL,
    "latePayment6089" bigint NOT NULL,
    "latePayment90" bigint NOT NULL,
    "openCreditLines" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "credit_preference"
    ADD CONSTRAINT "credit_preference_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "auth_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20260127075758418', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260127075758418', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
