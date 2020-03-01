<!--
 * @Author: wjn
 * @Date: 2020-02-14 11:37:19
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-01 10:07:42
 -->
对比正常节点的
yum list installed | grep cloudera

查看yum源中的cloudera-manager组件
yum search cloudera-manager

安装cloudera-manager-agent

yum install cloudera-manager-agent.x86_64

修改配置

vi /etc/cloudera-scm-agent/config.ini

server_host=cm的ip地址

重启

systemctl restart cloudera-scm-agent    

yum 安装报libmysqlclient.so.18()(64bit)---Linux报错

# wget http://www.percona.com/redir/downloads/Percona-XtraDB-Cluster/5.5.37-25.10/RPM/rhel6/x86_64/Percona-XtraDB-Cluster-shared-55-5.5.37-25.10.756.el6.x86_64.rpm
# rpm -ivh Percona-XtraDB-Cluster-shared-55-5.5.37-25.10.756.el6.x86_64.rpm
