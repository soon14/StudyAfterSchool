<!--
 * @Author: wjn
 * @Date: 2020-09-24 10:08:54
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-24 10:10:51
-->
yum 方式安装
vi /etc/yum.repos.d/jenkins.repo 
[jenkins]
name=Jenkins
baseurl=http://pkg.jenkins.io/redhat
gpgcheck=1

yum install -y jenkins
