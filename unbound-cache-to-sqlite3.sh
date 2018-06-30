#/bin/bash
#Peter Kowalsky - 29.06.2018 - ./unbound-cache.sh /srv/sqlite/unbound-cache.db
SQLITE_DB_LOC=$1
/usr/sbin/unbound-control dump_cache > ~/.cache.tmp
rm -f $SQLITE_DB_LOC.old
mv $SQLITE_DB_LOC $SQLITE_DB_LOC.old
touch $SQLITE_DB_LOC
/usr/bin/sqlite3 $SQLITE_DB_LOC "create table cache (id INTEGER PRIMARY KEY,domain TEXT,type TEXT, result TEXT);"
LNG="$(cat ~/.cache.tmp | wc -l)"
while read -r line; do
if [[ $line = *"    "* ]]; then
  IFS=' ' read -ra AR_LINE <<< "$line"
  /usr/bin/sqlite3 $SQLITE_DB_LOC "PRAGMA synchronous=OFF;insert into cache (domain,type,result) values ('${AR_LINE[0]}','${AR_LINE[3]}','${AR_LINE[4]}');"
fi
done < ~/.cache.tmp
rm ~/.cache.tmp



