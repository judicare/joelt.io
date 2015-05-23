-- Revert webapp2:schema from pg

BEGIN;

DROP SCHEMA webapp2;

COMMIT;
