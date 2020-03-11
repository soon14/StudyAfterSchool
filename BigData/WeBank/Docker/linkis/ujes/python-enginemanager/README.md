<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:16:37
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:17:10
 -->
# 构建镜像

    docker build -t linkis-ujes-python-enginemanager .

# 标记上传镜像

    docker tag linkis-ujes-python-enginemanager wjn0918/webank-linkis:linkis-ujes-python-enginemanager

    docker push wjn0918/webank-linkis:linkis-ujes-python-enginemanager