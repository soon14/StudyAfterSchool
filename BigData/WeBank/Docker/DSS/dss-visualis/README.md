<!--
 * @Author: wjn
 * @Date: 2020-03-10 15:28:09
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 13:19:47
 -->

需要添加hadoop_conf 目录


visualis.fd.com:9088

# 构建镜像

    docker build -t visualis-server .

# 复制并更改配置文件

    docker cp visualis-server:/usr/local/visualis-server/conf .

conf/application.yml中的jdbc和端口地址

# 重启镜像



docker tag visualis-server wjn0918/webank-linkis:visualis-server
docker push wjn0918/webank-linkis:visualis-server



FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD visualis-server.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/visualis-server/
CMD [ "./bin/start-visualis-server.sh" ]