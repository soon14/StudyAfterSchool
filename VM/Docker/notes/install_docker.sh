###
 # @Author: wjn
 # @Date: 2020-09-06 05:58:55
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-06 12:32:37
### 
#!/bin/bash

# 下载安装脚本
curl -fsSL get.docker.com -o /usr/local/docker/get-docker.sh

# 更改镜像源
sh /usr/local/docker/get-docker.sh --mirror Aliyun

# 新建分组和用户
groupadd docker
useradd -g docker docker

# 启动docker
systemctl enable docker
systemctl start docker

# 镜像加速
cat>/etc/docker/daemon.json<<EOF
{
    "registry-mirrors": [
        "https://registry.docker-cn.com",
	    "http://hub-mirror.c.163.com"
    ]
}
EOF

systemctl daemon-reload
systemctl restart docker

