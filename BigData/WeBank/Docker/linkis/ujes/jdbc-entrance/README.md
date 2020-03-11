<!--
 * @Author: wjn
 * @Date: 2020-03-11 16:55:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 16:59:46
 -->
# 构建镜像

    docker build -t linkis-ujes-jdbc-entrance .

# 标记上传镜像

    docker tag linkis-ujes-jdbc-entrance wjn0918/webank-linkis:linkis-ujes-jdbc-entrance

    docker push wjn0918/webank-linkis:linkis-ujes-jdbc-entrance