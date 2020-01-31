https://registry.hub.docker.com/_/registry

# 配置registry 客户端

配置/etc/docker/daemon.json
添加

"insecure-registries": [
    "192.168.137.100:5000"
]

重启docker

systemctl restart docker

检查是否配置成功

docker info 

# 上传镜像到私服

    docker tag tomcat 192.168.137.100:5000/tomcat

tag  --标记本地tomcat镜像
192.168.137.100:5000  --私服地址（官方默认添加ip和端口）

    docker push 192.168.137.100:5000/tomcat

# 查看私服镜像
    
http://master:5000/v2/tomcat/tags/list
