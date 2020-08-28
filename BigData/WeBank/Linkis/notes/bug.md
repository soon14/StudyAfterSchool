0.9.3

json4s  版本冲突
jersey  冲突








# linkis 

1. 执行脚本没有权限

查看/tmp/udf的属主

2. hadoop 3 +的版本会报如下错：No FileSystem for scheme "hdfs"

这个是因为hadoop版本从2升级到3后，hdfsclient的包有做改变，在2的版本为hadoop-hdfs，到3后改为hadoop-hdfs-client开头，拷贝到对应的目录即可。另外hadoop3还需要在core-site.xml里面配置：fs.hdfs.impl=org.apache.hadoop.hdfs.DistributedFileSystem  
解决：
cp /opt/cloudera/parcels/CDH/jars/hadoop-hdfs-client-3.0.0-cdh6.1.1.jar /home/webank/linkis/linkis-ujes-python-enginemanager/lib


3. getBaseInfo   but 2

dss_user 数据重复

4. The user has obtained the filesystem for more than 2000s. Please contact the administrator.（用户获取filesystem的时间超过2000s，请联系管理员）.
解决：
publicservice  服务中也需要添加hadoop-hdfs-client-3.0.0-cdh6.1.1.jar