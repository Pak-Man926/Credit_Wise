BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "phone_number_unique" ON "auth_user" USING btree ("phoneNumber");
--
-- ACTION CREATE TABLE
--
CREATE TABLE "credit_preference" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "creditUsage" double precision NOT NULL,
    "latePaymentHistory" double precision NOT NULL,
    "openCreditLines" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "loan_preference" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "loanAmount" double precision NOT NULL,
    "repaymentPeriod" bigint NOT NULL,
    "repaymentHistory" double precision NOT NULL,
    "employmentType" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "profile_data" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "age" bigint NOT NULL,
    "dependants" bigint NOT NULL,
    "monthlyIncome" double precision NOT NULL,
    "debtRatio" double precision NOT NULL,
    "contributorIncome" double precision NOT NULL
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "loan_preference"
    ADD CONSTRAINT "loan_preference_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "auth_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "profile_data"
    ADD CONSTRAINT "profile_data_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "auth_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR credit_wise
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('credit_wise', '20260121211949074', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260121211949074', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
