sed -i "s/127.0.0.1/192.168.10.190/g"  config.sh
sed -i "s/GATEWAY_PORT=9001/GATEWAY_PORT=9101/g"  config.sh



MYSQL_HOST=192.168.10.190
MYSQL_PORT=3306
MYSQL_DB=
MYSQL_USER=
MYSQL_PASSWORD=


sed -i "s/MYSQL_HOST=/MYSQL_HOST=${MYSQL_HOST}/g"  config.sh



