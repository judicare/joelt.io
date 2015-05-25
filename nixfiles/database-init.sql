CREATE OR REPLACE FUNCTION exec(text) returns text language plpgsql volatile
  AS $f$
    BEGIN
      EXECUTE $1;
      RETURN $1;
    END;
$f$;

SELECT exec('CREATE GROUP webapp_users')
WHERE NOT EXISTS(SELECT 1 FROM pg_group WHERE groname='webapp_users');

SELECT exec(format(
    'CREATE ROLE %I UNENCRYPTED PASSWORD %L LOGIN',
    username, password
    ))
FROM (VALUES (:'PGUSER', :'PGPASS'), ('migrate', :'MIGRATEPASS')) v(username, password)
WHERE NOT EXISTS(
  SELECT 1 FROM pg_user WHERE usename=username
);

ALTER GROUP webapp_users ADD USER :"PGUSER";

GRANT CREATE ON DATABASE :"PGDATABASE" TO migrate;
