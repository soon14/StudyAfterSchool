1. Hive Metastore Server 无法启动，无法连接数据库，将jar包复制到hive的lib目录下

cp mysql-connector-java-5.1.38.jar /opt/cloudera/parcels/CDH-5.16.2-1.cdh5.16.2.p0.8/lib/hive/lib/




2. return code 30041 from org.apache.hadoop.hive.ql.exec.spark.SparkTask

spark.executor.memory 配置过小,小于yarn中下面配置
yarn.scheduler.maximum-allocation-mb