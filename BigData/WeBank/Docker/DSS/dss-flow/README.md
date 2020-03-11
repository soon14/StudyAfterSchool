<!--
 * @Author: wjn
 * @Date: 2020-03-11 11:00:02
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 11:01:52
 -->
**DSS-FLOW部署**

    mkdir /usr/local/dss/dss-flow/
    cd /usr/local/dss/dss-flow/

# 编写docker-compose.yml
```
version: '3'
services: 
  dss-flow-execution-entrance:
    restart: always
    image: wjn0918/webank-linkis:dss-flow-execution-entrance
    container_name: dss-flow-execution-entrance
    ports: 
        - 9006:9006
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        # - ./conf:/usr/local/dss-flow-execution-entrance/conf
        # - ./bin:/usr/local/dss-flow-execution-entrance/bin
        - ./logs:/usr/local/dss-flow-execution-entrance/logs
           
```

<font color="red">192.168.137.60  更改为本机IP</font>


# 启动服务

    docker-compose up -d

* 查看启动日志 

        tail -f logs/linkis.out

# 复制配置文件到本地

        docker cp dss-flow-execution-entrance:/usr/local/dss-flow-execution-entrance/conf .

# 解除docker-compose.yml中配置中的注释
# 重启容器
```
docker-compose down
docker-compose up -d
```