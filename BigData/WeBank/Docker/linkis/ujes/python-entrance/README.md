<!--
 * @Author: wjn
 * @Date: 2020-03-11 17:20:39
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 17:21:02
 -->
# 构建镜像

    docker build -t linkis-ujes-python-entrance .

# 标记上传镜像

    docker tag linkis-ujes-python-entrance wjn0918/webank-linkis:linkis-ujes-python-entrance

    docker push wjn0918/webank-linkis:linkis-ujes-python-entrance