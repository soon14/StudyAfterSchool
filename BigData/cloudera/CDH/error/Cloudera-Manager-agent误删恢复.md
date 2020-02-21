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