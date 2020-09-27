<!--
 * @Author: wjn
 * @Date: 2020-03-03 09:39:31
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-27 15:26:42
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

# 添加环境变量
    environment:
      LINKIS_GATEWAY_URL: http://192.168.10.190:9101

# 指定网络模式

network_mode: "host"