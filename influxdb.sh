#/bin/bash
#Peter Kowalsky - 30.06.2018 - ./influx.sh "/root/src/UNflux/analyze-sqlite3.sh" "http://127.0.0.1:8086/write?db=opentsdb"
HOSTNAME=$(hostname)
INFLUX_DB_LOC=$2
CURL_ARGS="-i -XPOST"
TYPES="A,AAAA,CNAME,NS"
for z in $(echo $TYPES | sed "s/,/ /g")
do
  DATA=$($1 $z)
  for i in $(echo $DATA | sed "s/ / /g")
  do
    TAG=$(echo $i | cut -d':' -f1)
    VALUE=$(echo $i | cut -d':' -f2)
    #echo $TAG $VALUE
    curl $CURL_ARGS $INFLUX_DB_LOC --data-binary "unflux,host=$HOSTNAME,type=$z,tag=$TAG value=$VALUE"
    #echo "unflux,host=$HOSTNAME,type=$z,tag=$TAG value=$VALUE"
  done
done
