<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:09:45
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:13:32
 -->
# 构建镜像

    docker build -t linkis-ujes-hive-entrance .

# 标记上传镜像

    docker tag linkis-ujes-hive-entrance wjn0918/webank-linkis:linkis-ujes-hive-entrance

    docker push wjn0918/webank-linkis:linkis-ujes-hive-entrance