<!--
 * @Author: wjn
 * @Date: 2020-03-10 07:24:29
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 10:39:53
 -->

# dss前端配置


mkdir /usr/local/dss-front  
cd /usr/local/dss-front


# 编写docker-compose.yml
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

# 启动容器

```
docker-compose up -d
```

# 复制容器中配置文件到本地
    docker cp dss-front:/etc/nginx/nginx.conf .

# 更改nginx.conf

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
            proxy_pass http://192.168.137.60:9101; # linkis-gateway服务的ip端口
            
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


# 解除docker-compose.yml挂载注释，重启容器

```
docker-compose down
docker-compose up -d
```