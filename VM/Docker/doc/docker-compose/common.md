<!--
 * @Author: wjn
 * @Date: 2020-03-03 09:39:31
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-05 13:03:12
 -->

https://docs.docker.com/compose/gettingstarted/
# [docker-compose.yml模板](docker-compose.yml)

# 指令说明



**启动**

    docker-compose up 
**后台运行**

    docker-compose up -d 

**停止容器**

    docker-compose stop

**停止容器并删除**

    docker-compose down

**停止容器并删除挂载**

    docker-compose down --volumes


**指定host映射**

    extra_hosts:
        - "eureka.fd.com:127.0.0.1"

**管理多个服务**

直接在docker-compose.yml 中定义即可