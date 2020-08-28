###
 # @Author: wjn
 # @Date: 2020-08-23 11:24:34
 # @LastEditors: wjn
 # @LastEditTime: 2020-08-23 11:25:55
### 
http://mirrors.jenkins-ci.org/redhat/jenkins-2.249-1.1.noarch.rpm

需要更改镜像源

vi /var/lib/jenkins/hudson.model.UpdateCenter.xml


<?xml version='1.1' encoding='UTF-8'?>
<sites>
  <site>
    <id>default</id>
    <url>http://mirror.xmission.com/jenkins/updates/update-center.json</url>
  </site>
</sites>


cd /var/lib/jenkins/plugins

wget https://updates.jenkins-ci.org/download/plugins/cloudbees-folder/5.2.2/cloudbees-folder.hpi
chown jenkins:jenkins cloudbees-folder.hpi