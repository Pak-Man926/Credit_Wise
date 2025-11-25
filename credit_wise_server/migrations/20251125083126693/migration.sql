BEGIN;


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20251125083126693', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251125083126693', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
