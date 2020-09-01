<!--
 * @Author: wjn
 * @Date: 2020-08-29 00:38:59
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-29 21:09:48
-->


soft| 添加yum源| yum安装
-|-|-
ansible| yum-config-manager --add-repo https://mirror.tuna.tsinghua.edu.cn/epel/7/x86_64/ | yum install -y --nogpgcheck ansible
pip| | yum -y install epel-release && yum install -y python-pip
nginx| yum-config-manager --add-repo http://nginx.org/packages/centos/$releasever/$basearch/ | yum install -y --nogpgcheck nginx
docker| yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo | yum install -y --nogpgcheck docker

* 添加镜像地址
远程
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
本地
yum-config-manager --add-repo file:///home/docker

* 只下载不安装

yum install <softName> --downloadonly --downloaddir=/home/docker


# error

* Public key for containerd.io-1.2.13-3.2.el7.x86_64.rpm is not installed

设置 gpgcheck=0