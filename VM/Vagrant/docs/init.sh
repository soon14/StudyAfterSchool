###
 # @Author: wjn
 # @Date: 2020-08-30 12:56:03
 # @LastEditors: wjn
 # @LastEditTime: 2020-08-30 13:03:15
### 
#!/bin/bash


# install ansible
yum-config-manager --add-repo https://mirror.tuna.tsinghua.edu.cn/epel/7/x86_64/
yum install -y --nogpgcheck ansible

# install git
yum install -y --nogpgcheck git

# install java
yum install -y --nogpgcheck java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-demo  java-1.8.0-openjdk-devel java-1.8.0-openjdk-javadoc

# install maven
yum install -y --nogpgcheck maven