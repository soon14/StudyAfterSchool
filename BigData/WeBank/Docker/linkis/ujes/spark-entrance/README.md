<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:30:00
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:30:24
 -->
# 构建镜像

    docker build -t linkis-ujes-spark-entrance .

# 标记上传镜像

    docker tag linkis-ujes-spark-entrance wjn0918/webank-linkis:linkis-ujes-spark-entrance

    docker push wjn0918/webank-linkis:linkis-ujes-spark-entrance