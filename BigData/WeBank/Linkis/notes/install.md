<!--
 * @Author: wjn
 * @Date: 2020-07-14 09:25:11
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-14 09:25:20
--> 


#JDK
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.el7_8.x86_64
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