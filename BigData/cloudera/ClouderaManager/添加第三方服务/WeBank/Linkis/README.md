<!--
 * @Author: wjn
 * @Date: 2020-07-03 16:16:00
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-03 17:18:13
--> 
# 准备
cm_ext 上传到/tmp目录下

# parcel 制作
POINT_VERSION=0.9.3 VALIDATOR_DIR=/tmp/cm_ext OS_VER=el7 PARCEL_NAME=Linkis ./build-parcel.sh /tmp/linkis/wedatasphere-linkis-0.9.3-dist.tar.gz

# 


# make_manifest.json 制作
python /tmp/cm_ext/make_manifest/make_manifest.py /var/www/html/es/

# csd 制作
VALIDATOR_DIR=/tmp/cm_ext CSD_NAME=ElasticSearch ./build-csd.sh