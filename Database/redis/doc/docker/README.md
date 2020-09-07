<!--
 * @Author: wjn
 * @Date: 2020-09-07 03:22:08
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-07 03:24:30
-->
mkdir /etc/redis/
cp redis.conf /etc/redis/

# 默认已开启密码认证（默认 密码123456） 修改requirepass  

# 构建镜像
docker build . -t redis:6.0.7

# 启动镜像
docker-compose up -d