1. Linkis简单版(0.9.1及以上)，[如何安装Linkis](https://github.com/WeBankFinTech/Linkis/wiki/%E5%A6%82%E4%BD%95%E5%BF%AB%E9%80%9F%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8Linkis)



2. JDK (1.8.0_141以上)，如何安装JDK

3. MySQL (5.5+)，如何安装MySQL

4. Nginx，如何安装Nginx

5. Qualitis 如何安装Qualitis

soft| is_install|
-|-
Gradle (4.9)| 1
MySQL (5.5+) | 1
JDK (1.8.0_141) | 1
Linkis（0.9.1)必装Spark引擎。如何安装Linkis | 1
DataSphereStudio (0.6.0) 可选. 如果你想使用工作流，必装 | 
Hadoop (2.7.2) | 1
Hive (1.2.1) | 1
Zookeeper (3.4.9) | 1 
DataSphereStudio 如何安装DataSphereStudio? | 



```
server {
            listen       8088;# 访问端口
            server_name  localhost;
            #charset koi8-r;
            #access_log  /var/log/nginx/host.access.log  main;
            location /dss/visualis {
            root   /appcom/Install/DSS/FRONT; # visualis静态文件目录
            autoindex on;
            }
            location / {
            root   /appcom/Install/DSS/FRONT/dist; # 前端包解压的目录
            index  index.html index.html;
            }
            location /ws {#webSocket配置支持
            proxy_pass http://slave2:9009;#linkis-gateway服务的ip端口
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            }
            location /api {
            proxy_pass http://slave2:9009; # linkis-gateway服务的ip端口
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header x_real_ipP $remote_addr;
            proxy_set_header remote_addr $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_http_version 1.1;
            proxy_connect_timeout 4s;
            proxy_read_timeout 600s;
            proxy_send_timeout 12s;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection upgrade;
            }
            #error_page  404              /404.html;
            # redirect server error pages to the static page /50x.html
            #
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
            root   /usr/share/nginx/html;
            }
        }


```


6. Azkaban 如何安装Azkaban


