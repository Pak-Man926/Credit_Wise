BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "credit_prediction" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "riskProbability" double precision NOT NULL,
    "simulatedScore" bigint NOT NULL,
    "scoreBand" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "loan_prediction" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "approvalProbability" double precision NOT NULL,
    "approvalBand" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "credit_prediction"
    ADD CONSTRAINT "credit_prediction_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "auth_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "loan_prediction"
    ADD CONSTRAINT "loan_prediction_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "auth_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20260129161609153', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129161609153', "timestamp" = now();

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
