<!--
 * @Author: wjn
 * @Date: 2020-03-11 10:40:31
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-27 13:51:11
 -->


docker build -t webank-eureka .


**Eureka部署**

    mkdir /usr/local/linkis/eureka
    cd /usr/local/linkis/eureka

# 编写docker-compose.yml
```
version: '3'
services: 
  eureka:
    restart: always
    image: wjn0918/webank-linkis:eureka
    container_name: eureka
    ports: 
        - 20303:20303
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        - ./logs:/usr/local/eureka/logs
        # - ./conf:/usr/local/eureka/conf
```

<font color="red">192.168.137.60  更改为本机IP</font>


# 启动服务

    docker-compose up -d

**查看启动日志**

    tail -f logs/linkis.out

# 复制配置文件到本地

    docker cp eureka:/usr/local/eureka/conf .

# 解除docker-compose.yml中配置中的注释

# 重启容器
```
docker-compose down
docker-compose up -d
```