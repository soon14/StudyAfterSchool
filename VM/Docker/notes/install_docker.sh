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
    "https://registry.docker-cn.com"
]
}
EOF

systemctl daemon-reload
systemctl restart docker

