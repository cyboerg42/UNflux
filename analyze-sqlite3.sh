#/bin/bash
#Peter Kowalsky - 29.06.2018 - ./analyze.sh "/srv/sqlite/unbound-cache.db.old" [A|AAAA|CNAME|NS]
SQLITE_DB_LOC=$1
TYPE=$2
TOTAL_A=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE type = '$TYPE'" | wc -l)
TOTAL_COM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%.com.' AND type = '$TYPE'" | wc -l)
TOTAL_ORG=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%.org.' AND type = '$TYPE'" | wc -l)
TOTAL_NET=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%.net.' AND type = '$TYPE'" | wc -l)
TOTAL_AT=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%.at.' AND type = '$TYPE'" | wc -l)
TOTAL_DE=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%.de.' AND type = '$TYPE'" | wc -l)
AMAZON_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%amazon%' AND type = '$TYPE'" | wc -l)
AZURE_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%azure%' AND type = '$TYPE'" | wc -l)
GOOGLE_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%google%' AND type = '$TYPE'" | wc -l)
MICROSOFT_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%microsoft%' AND type = '$TYPE'" | wc -l)
FACEBOOK_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%facebook%' AND type = '$TYPE'" | wc -l)
REDDIT_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%reddit%' AND type = '$TYPE'" | wc -l)
TWITTER_NUM=$(sqlite3 $SQLITE_DB_LOC "select * from cache WHERE domain LIKE '%twitter%' AND type = '$TYPE'" | wc -l)

echo "total:"$TOTAL_A
echo "com:"$TOTAL_COM
echo "org:"$TOTAL_ORG
echo "net:"$TOTAL_NET
echo "de:"$TOTAL_DE
echo "at:"$TOTAL_AT
echo "amazon:"$AMAZON_NUM
echo "azure:"$AZURE_NUM
echo "google:"$GOOGLE_NUM
echo "microsoft:"$MICROSOFT_NUM
echo "facebook:"$FACEBOOK_NUM
echo "reddit:"$REDDIT_NUM
echo "twitter:"$TWITTER_NUM

