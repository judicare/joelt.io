-- Deploy webapp2:schema to pg

BEGIN;

SET client_min_messages = 'warning';

CREATE TABLE posts (
  id SERIAL PRIMARY KEY UNIQUE,
  title TEXT NOT NULL,
  slug TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT "unique_post" UNIQUE("slug")
);

GRANT SELECT, INSERT, UPDATE ON posts TO GROUP webapp_users;
GRANT USAGE ON SEQUENCE posts_id_seq TO GROUP webapp_users;

COMMIT;
