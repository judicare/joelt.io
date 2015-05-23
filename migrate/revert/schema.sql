-- Revert webapp2:schema from pg

BEGIN;

DROP TABLE posts;

COMMIT;
