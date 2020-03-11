<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:25:35
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:26:16
 -->
# 构建镜像

    docker build -t linkis-ujes-spark-enginemanager .

# 标记上传镜像

    docker tag linkis-ujes-spark-enginemanager wjn0918/webank-linkis:linkis-ujes-spark-enginemanager

    docker push wjn0918/webank-linkis:linkis-ujes-spark-enginemanager