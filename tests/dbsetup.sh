cleanup () {
  echo stopping the postgres database server and cleaning up...
  pg_ctl -D $datadir -w -o "-c listen_addresses= -c port=$PGPORT" stop
  rm -rf $datadir
}

trap cleanup EXIT

# todo: remove once security-tool builds
ln -s /usr/bin/security $TMPDIR/security
export PATH="$PATH:$TMPDIR"

dbpid=
datadir=$(mktemp -d "$TMPDIR/postgresXXXXX")

export PGPORT=34567

echo starting the postgres database server...
initdb $datadir
pg_ctl -D $datadir -w -o "-c listen_addresses= -c port=$PGPORT" start

createdb -p $PGPORT -h /tmp

dbpid=$!
