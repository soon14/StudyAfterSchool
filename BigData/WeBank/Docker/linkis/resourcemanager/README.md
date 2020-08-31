<!--
 * @Author: wjn
 * @Date: 2020-03-11 16:46:20
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 16:54:01
 -->

# 构建镜像

    docker build -t linkis-resourcemanager .

# 标记上传镜像

    docker tag linkis-resourcemanager wjn0918/webank-linkis:linkis-resourcemanager

    docker push wjn0918/webank-linkis:linkis-resourcemanager