1. [java.lang.NoClassDefFoundError: org/apache/hadoop/fs/FSDataInputStream](https://www.cnblogs.com/yanghuabin/p/8329205.html)



从spark1.4以后，所有spark的编译都是没有将hadoop的classpath编译进去的，所以必须在spark-env.sh中指定hadoop中的所有jar包。

具体设置如下：

在spark-evn.sh中添加
export SPARK_DIST_CLASSPATH=$(hadoop classpath)


[官方解释](https://spark.apache.org/docs/latest/hadoop-provided.html#using-sparks-hadoop-free-build)

更改后未解决，在/etc/profile 中引入


添加依赖
spark-evn.sh

export SPARK_MASTER_HOST=127.0.0.1
export SPARK_LOCAL_IP=127.0.0.1
export HADOOP_HOME=/usr/local/hadoop/hadoop-2.8.0
export HIVE_HOME=/usr/local/hadoop/apache-hive-2.1.1-bin
export HIVE_CONF_DIR=${HIVE_HOME}/conf
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HDFS_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop

export CDH_LIB_HOME=/opt/cloudera/parcels/CDH-6.2.1-1.cdh6.2.1.p0.1425774/jars
export SPARK_CLASSPATH=$CDH_LIB_HOME:$SPARK_CLASSPATH


