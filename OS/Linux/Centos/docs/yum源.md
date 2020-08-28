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