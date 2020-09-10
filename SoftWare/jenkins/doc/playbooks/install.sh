###
 # @Author: wjn
 # @Date: 2020-09-10 09:01:56
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-10 09:02:21
### 
#!/bin/bash
# 需要先安装curl
yum install -y --nogpgcheck curl

# 运行ansible,失败重试，多运行几次
ansible-galaxy install geerlingguy.jenkins
ansible-playbook playbook.yml


