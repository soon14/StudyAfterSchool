[列举文件夹结构](#1)

[nodejs](#2)

[mvn](#3)


# <span id="1">列举文件夹结构</span>

```
yum install tree
```
tree -a 文件名

# <span id="2">[nodejs](https://blog.csdn.net/wanchaopeng/article/details/85061650)</span>

```
curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
```

# <span id="3">mvn</span>

```
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo

sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo

yum -y install apache-maven
```