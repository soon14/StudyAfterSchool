https://github.com/WeBankFinTech/Linkis


[安装文档](https://github.com/WeBankFinTech/Linkis/wiki/%E5%A6%82%E4%BD%95%E5%BF%AB%E9%80%9F%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8Linkis)

```
>logs/start.log 2>logs/error.log
```



curator-client 版本更新到4.0.1



```
#JDK
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64
#CDH
CDH_HOME=/opt/cloudera/parcels/CDH-6.2.1-1.cdh6.2.1.p0.1425774
#HADOOP  
export HADOOP_HOME=$CDH_HOME/lib/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#Hive
export HIVE_HOME=$CDH_HOME/lib/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
#Spark
export SPARK_HOME=/opt/cloudera/parcels/CDH-6.2.1-1.cdh6.2.1.p0.1425774/lib/spark
export SPARK_CONF_DIR=$CDH_HOME/bin/spark-submit
export PYSPARK_ALLOW_INSECURE_GATEWAY=1  # Pyspark必须加的参数


```








组件| 是否安装| 说明
-|-|-
APPJOINTENTRANCE| (已安装)| DSS
BML-SERVER| (已安装)
CLOUD-DATASOURCE|(已安装) | 安装包位于/opt/linkis/share/linkis
CLOUD-PUBLICSERVICE| (已安装) | ./bin/start-publicservice.sh >linkis.log 2>linkis.out
DATAWORKCLOUD| (已安装)
DATAWORKCLOUD-GATEWAY| (已安装)| 端口改为9009
DSS-SERVER| (已安装)|DSS
FLOWEXECUTIONENTRANCE| (已安装)| DSS
HIVEENGINEMANAGER| (已安装)
HIVEENTRANCE| (已安装)
JDBCENTRANCE| (已安装)
PYTHONENGINEMANAGER| (已安装)
PYTHONENTRANCE| (已安装)
RESOURCEMANAGER|(已安装)
SPARKENGINEMANAGER|
SPARKENTRANCE|
VISUALIS| | DSS 





# linkis-appjoint-entrance DSS

1. com.webank.wedatasphere.linkis.storage.exception.StorageFatalException: errCode: 50001 ,desc: HDFS configuration was not read, please configure hadoop.config.dir or add env:HADOOP_CONF_DIR ,ip: slave2 ,port: 9005 ,serviceKind: appjointEntrance

查看配置信息（默认hadoopconf的路径为/appcom/config/hadoop-config）

环境变量中添加HADOOP_CONF_DIR地址
```
HADOOP_CONF_DIR=/opt/cloudera/parcels/CDH-5.16.2-1.cdh5.16.2.p0.8/lib/hadoop/etc/hadoop
export PATH=$PATH:${HADOOP_CONF_DIR}
```
重启linkis

```
mkdir -p /appcom/config/hadoop-config

cd  /opt/cloudera/parcels/CDH-5.16.2-1.cdh5.16.2.p0.8/lib/hadoop/etc/hadoop/

cp core-site.xml hdfs-site.xml yarn-site.xml mapred-site.xml /appcom/config/hadoop-config
```



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

同linkis-appjoint-entrance

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



# 前端部署

```
mkdir -p /appcom/Install/DSS/FRONT
unzip -d /appcom/Install/DSS/FRONT wedatasphere-dss-web-0.6.0-dist.zip
```






