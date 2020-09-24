<!--
 * @Author: wjn
 * @Date: 2020-09-24 10:08:54
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-24 11:44:47
-->
# yum 方式安装

配置yum源：
wget  -O  /etc/yum.repos.d/jenkins.repo  http://pkg.jenkins-ci.org/redhat/jenkins.repo
导入rpm密钥：
rpm  --import  https://jenkins-ci.org/redhat/jenkins-ci.org.key
安装：
yum  -y  install  jenkins  java
启动服务：
systemctl  start  jenkins
访问网址：
xx.xx.xx.xx:8080
根据提示进行安装

https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json