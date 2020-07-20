<!--
 * @Author: wjn
 * @Date: 2020-06-29 10:38:04
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-02 10:23:56
--> 

# windows编写的shell 脚本在linux上需要

:set fileformat=unix
:wq


# Cloudera Manager中安装部署Elasticsearch服务

https://github.com/ibagomel/elasticsearch-parcel


# ES 下载
https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.7.1.tar.gz



# parcel 制作
POINT_VERSION=5 VALIDATOR_DIR=/tmp/cm_ext OS_VER=el7 PARCEL_NAME=ElasticSearch ./build-parcel.sh /tmp/elasticsearch/elasticsearch-bin.tar.gz

# csd 制作
VALIDATOR_DIR=/tmp/cm_ext CSD_NAME=ElasticSearch ./build-csd.sh


# 文件移动

mv build-parcel/ELASTICSEARCH-0.0.5.elasticsearch.p0.5-el7.parcel /var/www/html/es/

sha1sum  /var/www/html/es/ELASTICSEARCH-0.0.5.elasticsearch.p0.5-el7.parcel | awk '{ print $1 }' > /var/www/html/es/ELASTICSEARCH-0.0.5.elasticsearch.p0.5-el7.parcel.sha

python /tmp/cm_ext/make_manifest/make_manifest.py /var/www/html/es/

mv build-csd/ELASTICSEARCH-1.0.jar /opt/cloudera/csd/



# 报错


1. Likely root cause: java.nio.file.AccessDeniedException

chmod 777 /opt/cloudera/parcels/ELASTICSEARCH/config/


systemctl restart cloudera-scm-server
tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log




scp ELASTICSEARCH-0.0.5.elasticsearch.p0.5-el7.parcel root@192.168.10.191:/var/www/html/es
scp ELASTICSEARCH-1.0.jar root@192.168.10.191:/opt/cloudera/csd
scp ELASTICSEARCH-0.0.5.elasticsearch.p0.5-el7.parcel.sha root@192.168.10.191:/var/www/html/es