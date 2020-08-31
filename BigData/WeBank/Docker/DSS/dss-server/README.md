<!--
 * @Author: wjn
 * @Date: 2020-03-10 14:56:11
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 10:54:03
 -->

**DSS-SERVER部署**

      mkdir /usr/local/dss/dss-server
      cd /usr/local/dss/dss-server

# 编写docker-compose.yml
```
version: '3'
services: 
  dss-server:
    restart: always
    image: wjn0918/webank-linkis:dss-server
    container_name: dss-server
    ports: 
        - 9004:9004
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        # - ./conf:/usr/local/dss-server/conf
        - ./logs:/usr/local/dss-server/logs
        
```

<font color="red">192.168.137.60  更改为本机IP</font>


# 启动服务

      docker-compose up -d

* 查看启动日志 

      tail -f logs/linkis.out

# 复制配置文件到本地

      docker cp dss-server:/usr/local/dss-server/conf .

# 解除docker-compose.yml中配置中的注释

# 重启容器
```
docker-compose down
docker-compose up -d
```