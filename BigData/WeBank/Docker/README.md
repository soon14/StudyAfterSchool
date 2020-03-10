<!--
 * @Author: wjn
 * @Date: 2020-03-03 09:41:54
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-10 10:55:11
 -->
**DSS容器化文档**



# [DSS-Front部署](#1)

# <span id="1">DSS-Front部署</span>
**DSS前端服务**

docker-compose.yml

```
version: '3'
services: 
  web:
    restart: always
    image: wjn0918/webank-linkis:dss-front
    container_name: dss-front
    ports: 
        - 80:80
    # volumes: 
    #     - ./nginx.conf:/etc/nginx/nginx.conf
```

1. 启动容器：
```
docker-compose up -d
```
2. 复制启动容器中的nginx.conf配置文件到当前目录
```
docker cp 容器ID:/etc/nginx/nginx.conf .
```
3. 更改nginx.conf如下

```
worker_processes  1;

events {
    worker_connections  1024;
}


http {
    include       mime.types;

    default_type  application/octet-stream;

    sendfile        on;

    keepalive_timeout  65;

    server {
            listen       80;# 访问端口
            server_name  localhost;
            location /dss/visualis {
            root   /FRONT/dss-web; # visualis静态文件目录
            autoindex on;
            }
            location / {
            root   /FRONT/dss-web/dist; # 前端包解压的目录
            index  index.html index.html;
            }
    
            location /api {
            proxy_pass http://127.0.0.1:10000; # linkis-gateway服务的ip端口
            
            }
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
            root   /usr/share/nginx/html;
            }
        }

    include vhost/*.conf;
}

## 需要添加，解决docker后台进程会关闭容器
daemon off;
```
4. 重启容器
```
docker-compose down
docker-compose up -d
```

# eureka服务

docker-compose.yml

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
        - "eureka.fd.com:127.0.0.1"
    volumes: 
        - /usr/local/linkis/eureka/logs:/usr/local/eureka/logs
        # - /usr/local/linkis/eureka/conf:/usr/local/eureka/conf
```
# linkis-gateway
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
        - /usr/local/linkis/linkis-gateway/logs:/usr/local/linkis-gateway/logs
        
```

# DSS-SERVER



