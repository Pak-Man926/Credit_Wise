BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "credit_preference" ALTER COLUMN "userId" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "loan_preference" ALTER COLUMN "userId" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "profile_data" ALTER COLUMN "userId" DROP NOT NULL;

--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20260121232456678', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260121232456678', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
