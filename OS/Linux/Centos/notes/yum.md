<!--
 * @Author: wjn
 * @Date: 2020-07-17 16:17:45
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-17 16:17:52
--> 

强制卸载

rpm -e --nodeps


yum源路径
/etc/yum.repos.d



命令| 说明
-|-
yum repolist| yum仓库展示
yum clean all | 清除缓存
yum makecache | 创建缓存
yum install --downloadonly --downloaddir=/tmp/ SERVER_NAME | 只下载不安装



ansible.repo
```
[ansible]
name=ansible
baseurl=https://mirror.tuna.tsinghua.edu.cn/epel/7/x86_64/
gpgcheck=0
```



2. 安装离线rpm包
yum install createrepo



yum --disablerepo=* --enablerepo=cloudera* list installed cloudera-manager-agent 

刷新元数据包
yum --disablerepo=* --enablerepo=cloudera* clean all 
yum --disablerepo=* --enablerepo=cloudera* makecache 