-- Revert webapp2:delete-posts from pg

BEGIN;

REVOKE DELETE ON posts FROM GROUP webapp_users;

COMMIT;
