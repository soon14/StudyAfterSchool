<!--
 * @Author: wjn
 * @Date: 2020-03-11 13:23:36
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 13:35:27
 -->

# 构建镜像
docker build -t qualitis .


# 复制配置文件到本地
docker cp qualitis:/usr/local/qualitis-0.7.0/conf .

更新数据库连接，zookeeper连接

