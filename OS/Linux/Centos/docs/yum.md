<!--
 * @Author: wjn
 * @Date: 2020-08-29 00:38:59
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-29 21:09:48
-->
ansible
```
[ansible]
name=ansible
baseurl=https://mirror.tuna.tsinghua.edu.cn/epel/7/x86_64/
gpgcheck=0
```

pip

yum -y install epel-release
yum install python-pip

nginx 

```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
```



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