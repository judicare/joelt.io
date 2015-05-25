{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.webapp2;
in
{
  options = {
    services.webapp2 = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Run the webapp.
        '';
      };

      package = mkOption {
        type = types.path;
        description = "Package to use.";
      };

      environment = mkOption {
        type = with types; uniq (enum ["Development" "Staging" "Production"]);
        description = ''
          Environment webapp should run in.
        '';
      };

      listenOn = mkOption {
        type = with types; uniq int;
        description = ''
          TCP port webapp should listen on.
        '';
      };

      database = mkOption {
        type = with types; uniq attrs;
        description = "the database configuration";
      };

      http = mkOption {
        type = with types; uniq attrs;
        description = "the HTTP configuration";
      };

      aws = mkOption {
        type = with types; uniq attrs;
        description = "the AWS configuration";
      };

      authy_key = mkOption {
        type = types.string;
        description = "the Authy API key";
      };

      authy_userid = mkOption {
        type = types.int;
        description = "the Authy user ID";
      };

      user = mkOption {
        type = with types; uniq string;
        default = "webapp2";
        description = ''
          Who should run the webapp2 process.
        '';
      };

      stateDir = mkOption {
        type = types.string;
        description = "Where to put assets in the service.";
        default = "/var/lib/webapp2";
      };
    };
  };

  config = mkIf cfg.enable {
    users.extraUsers."${cfg.user}" = {
      description = "webapp2 runner.";
      home = "/var/empty";
      createHome = true;
      useDefaultShell = true;
    };

    services.postgresql.enable = true;

    systemd.services.webapp2 = {
      wantedBy = [ "multi-user.target" ];
      requires = [ "postgresql.service" ];
      after = [ "postgresql.service" ];
      description = "Run the webapp2 server";
      environment = {
        # app stuff
        HOME = "/homeless-shelter";
        PORT = toString cfg.http.port;
        APPROOT = cfg.http.approot;
        STATICROOT = cfg.http.staticroot;

        # AWS
        AWS_ACCESS_KEY_ID = cfg.aws.key;
        AWS_ACCESS_KEY_SECRET = cfg.aws.secret;

        # Authy
        AUTHY_ENDPOINT = "api.authy.com";
        AUTHY_KEY = cfg.authy_key;
        AUTHY_USERID = builtins.toString cfg.authy_userid;

        # database
        PGHOST = cfg.database.host;
        PGPORT = toString cfg.database.port;
        PGUSER = cfg.database.user;
        PGPASS = cfg.database.password;
        PGDATABASE = cfg.database.name;

        MIGRATEPASS = cfg.database.migrationPassword;
      };

      path = [ pkgs.sudo config.services.postgresql.package cfg.package.tools.sqitch ];

      serviceConfig = {
        User = cfg.user;
        PermissionsStartOnly = true;
      };

      preStart = ''
        if [ -z "$(sudo psql postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$PGDATABASE'")" ]; then
          sudo createdb "$PGDATABASE" || exit 1
        fi

        cat ${./nixfiles/database-init.sql} \
          | sudo psql postgres \
              -v PGPASS="$PGPASS" -v PGUSER="$PGUSER" \
              -v MIGRATEPASS="$MIGRATEPASS" -v PGDATABASE="$PGDATABASE" \
              -v ON_ERROR_STOP=1 --single-transaction

        mkdir -p -m 0755 ${cfg.stateDir}
        chown -R ${cfg.user} ${cfg.stateDir}
        rm -rf ${cfg.stateDir}/*

        HOME=/var/empty sqitch --top-dir ${cfg.package}/migrate --engine pg \
          deploy "db:pg://migrate:$MIGRATEPASS@$PGHOST:$PGPORT/$PGDATABASE"
      '';
      script = ''
        cd ${cfg.stateDir}
        mkdir -p static config
        ln -sfv ${cfg.package}/static/* static/
        ${cfg.package}/bin/webapp2 ${cfg.package}/config/settings.yml
      '';
    };
  };
}
