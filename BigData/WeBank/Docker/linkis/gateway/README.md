<!--
 * @Author: wjn
 * @Date: 2020-03-10 16:42:06
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 10:50:43
 -->
**LINKIS-GATEWAY部署**

    mkdir /usr/local/linkis/linkis-gateway
    cd /usr/local/linkis/linkis-gateway


# 编写docker-compose.yml
```
version: '3'
services: 
  gateway:
    restart: always
    image: wjn0918/webank-linkis:linkis-gateway
    container_name: linkis-gateway
    ports: 
        - 9101:9101
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        - ./logs:/usr/local/linkis-gateway/logs
        # - ./conf:/usr/local/linkis-gateway/conf
        
```

<font color="red">192.168.137.60  更改为本机IP</font>


# 启动容器

    docker-compose up -d

* 查看启动日志 

      tail -f logs/linkis.out

# 复制配置文件到本地

    docker cp linkis-gateway:/usr/local/linkis-gateway/conf .

# 解除docker-compose.yml中配置中的注释

# 重启容器
```
docker-compose down
docker-compose up -d
```
