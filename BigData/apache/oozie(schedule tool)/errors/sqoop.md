1. Stdoutput Warning: /opt/cloudera/parcels/CDH-5.13.2-1.cdh5.13.2.p0.3/bin/../lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Stdoutput Please set $ACCUMULO_HOME to the root of your Accumulo installation.

原因：缺少accumulo目录

shell 脚本中添加

```
mkdir /var/lib/accumulo

export ACCUMULO_HOME=/var/lib/accumulo
```


2. Job init failed : org.apache.hadoop.yarn.exceptions.YarnRuntimeException: java.io.FileNotFoundException: File does not exist: hdfs://nameservice1/user/zfw_ww/.staging/job_1567998333580_2703/job.splitmetainfo

需要添加环境变量

HADOOP_USER_NAME=${wf:user()}

![image]()