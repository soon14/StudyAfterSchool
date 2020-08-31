<!--
 * @Author: wjn
 * @Date: 2020-03-12 19:46:46
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-12 19:46:58
 -->
# 删除所有none镜像

    docker rmi $(docker images | grep 'none' | awk '{print $3}')