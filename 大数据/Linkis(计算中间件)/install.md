https://github.com/WeBankFinTech/Linkis


[安装文档](https://github.com/WeBankFinTech/Linkis/wiki/%E5%A6%82%E4%BD%95%E5%BF%AB%E9%80%9F%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8Linkis)


# linkis-appjoint-entrance DSS

1. com.webank.wedatasphere.linkis.storage.exception.StorageFatalException: errCode: 50001 ,desc: HDFS configuration was not read, please configure hadoop.config.dir or add env:HADOOP_CONF_DIR ,ip: slave2 ,port: 9005 ,serviceKind: appjointEntrance

环境变量中添加HADOOP_CONF_DIR地址
```
HADOOP_CONF_DIR=/opt/cloudera/parcels/CDH-5.16.2-1.cdh5.16.2.p0.8/lib/hadoop/etc/hadoop
export PATH=$PATH:${HADOOP_CONF_DIR}
```
重启linkis


# *CLOUDER-DATASOURCE

# CLOUDER-PUBLICSERVICE

# DATAWORKCLOUD

# DATAWORKCLOUD-GATEWAY

9001 端口占用 替换为9009
/appcom/Install/Linkis/linkis-gateway/conf

需要启动
/appcom/Install/Linkis/linkis-gateway-bak
/appcom/Install/Linkis/linkis-gateway

# DSS-SERVER DSS

# *FLOWEXECUTIONENTRANCE
/appcom/Install/DSS/dss-flow-execution-entrance

1. HDFS configuration was not read, please configure hadoop.config.dir or add env:HADOOP_CONF_DIR ,ip: slave2 ,port: 9006 ,serviceKind: flowExecutionEntrance

同linkis-appjoint-entrance
等待会，才能注册上


# *HIVEENGINEMANAGER

1.  Load balancer does not have available server for client: ResourceManager

# HIVEENTRANCE

# JDBCENTRANCE

# PYTHONEGINEMANAGER

1. Load balancer does not have available server for client: ResourceManager

需要先注册RESOURCEMANAGER服务

# PYTHONENTRANCE

# RESOURCEMANAGER

1. 安装后没有

将安装包拷贝过去
/opt/linkis/share/linkis/rm

2. Could not find or load main class com.webank.wedatasphere.linkis.DataWorkCloudApplication

将mode 下的所有jar包拷贝到lib目录下

3. There is no known eureka server; cluster server list is empty

修改配置文件application.yml，和其它服务保持一致



# SPARKENGINEMANAGER

# SPARKENTRANCE

# VISUALIS（可视化服务）

[部署文档](https://github.com/WeBankFinTech/Visualis/blob/master/visualis_docs/zh_CN/Visualis_deploy_doc_cn.md)

1. HDFS configuration was not read, please configure hadoop.config.dir or add env:HADOOP_CONF_DIR', ip='slave2', port=9007, serviceKind='visualis'

同linkis-appjoint-entrance服务

2. 初始化数据库

需要同links是同一数据库

mysql -u -p -h 
use db
source davinci.sql

3. 内存不足
Native memory allocation (mmap) failed to map 4294967296 bytes for committing reserved memory.

大约4个G









tail -200 logs/linkis.log



