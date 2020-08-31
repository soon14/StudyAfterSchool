<!--
 * @Author: wjn
 * @Date: 2020-03-03 12:42:16
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-03 12:42:32
 -->

docker run -p 3306:3306 --name mysql \
-v /usr/local/docker/mysql/conf:/etc/mysql \
-v /usr/local/docker/mysql/data:/var/lib/mysql \
-v /usr/local/docker/mysql/logs:/var/log/mysql
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:5.7.22

# -v 后参数查找

1. 先启动容器
docker run -it --rm mysql:5.7.22

2. 查看MySQL
whereis mysql

3. 查看MySQL配置文件

# -e 环境变量

查看官方提供的镜像说明