cleanup () {
  echo stopping the postgres database server and cleaning up...
  pg_ctl -D $datadir -w -o "-c listen_addresses= -c port=$PGPORT" stop || true
  rm -rf $datadir || true
}

trap cleanup EXIT

datadir=$(mktemp -d "$TMPDIR/postgresXXXXX")

export PGPORT=34567

echo starting the postgres database server...
initdb $datadir
pg_ctl -D $datadir -w -o "-c listen_addresses= -c port=$PGPORT" start

createdb -p $PGPORT -h /tmp
