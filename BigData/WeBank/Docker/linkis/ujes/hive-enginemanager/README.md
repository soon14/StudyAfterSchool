<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:01:02
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:09:25
 -->

# 构建镜像

    docker build -t linkis-ujes-hive-enginemanager .

# 标记上传镜像

    docker tag linkis-ujes-hive-enginemanager wjn0918/webank-linkis:linkis-ujes-hive-enginemanager

    docker push wjn0918/webank-linkis:linkis-ujes-hive-enginemanager