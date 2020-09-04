###
 # @Author: wjn
 # @Date: 2020-09-04 01:15:31
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-04 06:39:29
### 
#!/bin/bash
YUM_SOURCE_DIR=/etc/yum.repos.d
YUM_SOURCE_BAK_DIR=/etc/yum.repos.d.bak

function install_ansible() {
    if [[ ! -d "${YUM_SOURCE_BAK_DIR}" ]]; 
    then
        mv $YUM_SOURCE_DIR $YUM_SOURCE_BAK_DIR
        mkdir $YUM_SOURCE_DIR
        cp -f local.repo /etc/yum.repos.d/local.repo
    else
        echo 'yum源已备份'
    fi
    mkdir /tmp/install

    # 解压ansible
    tar -xzvf /root/ansible.tar.gz -C /tmp/install
    yum clean all 

    echo '安装ansible'
    yum install -y ansible
}


ansible-playbook playbook.yml -i host.yml 