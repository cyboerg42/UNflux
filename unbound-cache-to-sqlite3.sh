#/bin/bash
#Peter Kowalsky - 29.06.2018 - unbound cache -> sqlite3 db - ./unbound-cache-to-sqlite.sh
SQLITE_DB_LOC=$1
/usr/sbin/unbound-control dump_cache > /tmp/.unbound-cache.tmp
rm -f $SQLITE_DB_LOC.old
rm -f /tmp/.output.db
mv $SQLITE_DB_LOC $SQLITE_DB_LOC.old
/usr/bin/python3 "`dirname \"$0\"`"/pybound.py &
wait
rm /tmp/.unbound-cache.tmp
mv /tmp/.output.db $SQLITE_DB_LOC

