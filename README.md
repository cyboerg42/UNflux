# UNflux
unbound cache stats to influxdb &amp; grafana

#### Install curl.

**Ubuntu 16.04 :**

```
apt-get update
apt-get install curl
```
#### Install UNflux.

```
git clone https://github.com/cyborg00222/UNflux/
cd UNflux
mkdir /root/scripts/
cp *.sh /root/scripts
cp *.py /root/scripts
```

#### Install crontab
```
crontab -e
*/3 * * * * /bin/bash /root/scripts/unbound-cache-to-sqlite3.sh "/srv/sqlite/unbound-cache.db"
*/3 * * * * /bin/bash /bin/sleep 30 & /root/scripts/influx.sh "/root/scripts/analyze-sqlite3.sh '/srv/sqlite/unbound-cache.db.old'" "http://127.0.0.1:8086/write?db=opentsdb"
```

