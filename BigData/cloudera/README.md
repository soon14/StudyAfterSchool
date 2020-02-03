# [软件下载地址](https://github.com/wjn0918/Study/blob/master/BigData/cloudera/Cloudera%20Manager/download_address.md)


# 集群角色分配

## 小于10台

测试/开发集群，建议至少5台，没有高可用，一个管理节点主要用于安装Name Node和Resource Manager，工具节点和边缘节点复用一个，主要用于安装ClouderaManager等，剩余3-7台工作节点



NN NameNode
JHS JobHistory Server
RM Resource Manager
ZK Zookeeper
HM HBase Master
SHS Spark History Server


CM Cloudera Manager
CMS Cloudera Manager Service
HMS HiveMetaStore
HS2 HiveServer2

DN DataNode
NM NodeManager


NFS Gateway

Balancer

GateWay hive客户端节点，会将配置文件推送到客户端节点中，用于hive 脚本运行

