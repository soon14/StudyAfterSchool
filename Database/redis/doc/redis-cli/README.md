<!--
 * @Author: wjn
 * @Date: 2020-09-07 02:37:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-07 03:25:05
-->
https://github.com/prettyyjnic/redisSky

# 构建并启动镜像
        sudo docker build -t prettyyjnic/redis-sky .
        sudo docker run -p 8089:8089 --rm prettyyjnic/redis-sky
