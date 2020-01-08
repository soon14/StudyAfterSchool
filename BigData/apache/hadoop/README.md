# [HttpFs](https://www.jianshu.com/p/9b46aebcb963)

HttpFS is a server that provides a REST HTTP gateway supporting all HDFS File System operations (read and write). And it is inteoperable with the webhdfs REST HTTP API.



# [Balancer](https://www.cnblogs.com/roger888/p/5531841.html)

balancer是当hdfs集群中一些datanodes的存储要写满了或者有空白的新节点加入集群时，用于均衡hdfs集群磁盘使用量的一个工具。

# [ISS](https://www.cnblogs.com/smuxiaolei/p/10847236.html)

Impala Statestore


1台机器上部署管理节点，通常包括的角色：

NN: NameNode (HDFS);

SHS: Spark History Server (Spark);

RM: Resource Manager (YARN);

JHS: JobHistoryServer

ZK: Zookeeper;

KM: kudu Master

ISS: Impala Statestore

1台机器部署工具节点/边缘节点：

工具节点通常包括的角色：

    CM: Cloudera Manager

    JN: JournalNode

    CMS: Cloudera Management service

    ICS: Impala Catelog service

    NMS: Navigator Metadata

    HMS: Hive Metadata

    NAS: Navigator Audit Srver

    ZK, Flume, Sqoop, Hue, HttpFS

边缘节点通常包括的角色：

    GW: Gateway configuration

    Hue, Sqoop, Flume, HiveServer

工作节点通常包括的角色：

    Impala Daemon, NodeManager, DataNode, Kudu Tablet Server



    