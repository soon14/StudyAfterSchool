<!--
 * @Author: wjn
 * @Date: 2020-01-31 23:12:05
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-07 11:40:38
 -->


# registry 客户端配置

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


docker tag mysql:5.7.20  192.168.10.64:5000/mysql:5.7.20
docker push 192.168.10.64:5000/mysql:5.7.20

# 私服下载镜像

docker pull 192.168.10.64:5000/mongo:latest

# 查看私服镜像
    
http://master:5000/v2/tomcat/tags/list


# 参考

https://registry.hub.docker.com/_/registry
https://registry.hub.docker.com/r/konradkleine/docker-registry-frontend
