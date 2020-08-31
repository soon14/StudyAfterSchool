<!--
 * @Author: wjn
 * @Date: 2020-03-11 10:57:22
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 10:59:20
 -->
**DSS-APPJOINT部署**

    mkdir /usr/local/dss/dss-appjoint
    cd /usr/local/dss/dss-appjoint

# 编写docker-compose.yml
```
version: '3'
services: 
  linkis-appjoint-entrance:
    restart: always
    image: wjn0918/webank-linkis:linkis-appjoint-entrance
    container_name: linkis-appjoint-entrance
    ports: 
        - 9005:9005
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        # - ./conf:/usr/local/linkis-appjoint-entrance/conf
        # - ./bin:/usr/local/linkis-appjoint-entrance/bin
        - ./logs:/usr/local/linkis-appjoint-entrance/logs
        
        
```

<font color="red">192.168.137.60  更改为本机IP</font>


# 启动服务

    docker-compose up -d

* 查看启动日志 

        tail -f logs/linkis.out

# 复制配置文件到本地

        docker cp linkis-appjoint-entrance:/usr/local/linkis-appjoint-entrance/conf .

# 解除docker-compose.yml中配置中的注释

# 重启容器
```
docker-compose down
docker-compose up -d
```