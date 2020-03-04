<!--
 * @Author: wjn
 * @Date: 2020-01-31 23:12:05
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-03 13:57:59
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

# 查看私服镜像
    
http://master:5000/v2/tomcat/tags/list


# 参考

https://registry.hub.docker.com/_/registry
https://registry.hub.docker.com/r/konradkleine/docker-registry-frontend
