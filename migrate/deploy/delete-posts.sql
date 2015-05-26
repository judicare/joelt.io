-- Deploy webapp2:delete-posts to pg
-- requires: schema

BEGIN;

GRANT DELETE ON posts TO GROUP webapp_users;

COMMIT;
