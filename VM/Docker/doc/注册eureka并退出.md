<!--
 * @Author: wjn
 * @Date: 2020-09-27 16:40:44
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-27 16:41:00
-->
通过运行exec命令，它将代替shell进程把SIGTERM传播到spring boot。

ENTRYPOINT [ "sh", "-c", "exec java -jar /apps/rms.jar"]



```
FROM 192.168.10.64:5000/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-publicservice.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-publicservice
EXPOSE 9102
ENV HOME=/usr/local/linkis-publicservice \
    SERVER_PID=/usr/local/linkis-publicservice/bin/linkis.pid \
    SERVER_LOG_PATH=/usr/local/linkis-publicservice/logs \
    SERVER_CLASS=com.webank.wedatasphere.linkis.DataWorkCloudApplication \
    SERVER_JAVA_OPTS="-Xmx512M -XX:+UseG1GC -Xloggc:$HOME/logs/linkis-gc.log"
ENTRYPOINT [ "sh", "-c", "exec java $SERVER_JAVA_OPTS -cp ../module/lib/*:$HOME/conf:$HOME/lib/* $SERVER_CLASS > $SERVER_LOG_PATH/linkis.out"]
```
