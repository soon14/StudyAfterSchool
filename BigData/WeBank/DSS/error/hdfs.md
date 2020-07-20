<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-15 15:18:21
--> 
Class org.apache.hadoop.hdfs.DistributedFileSystem not found

https://blog.csdn.net/Xurui_Luo/article/details/84545815

将hadoop-hdfs-client*.jar 放入linkis-publicservice 中


https://github.com/WeBankFinTech/Linkis/wiki/%E9%83%A8%E7%BD%B2%E5%92%8C%E7%BC%96%E8%AF%91%E9%97%AE%E9%A2%98%E6%80%BB%E7%BB%93
 hadoop 3 +的版本会报如下错：No FileSystem for scheme "hdfs"

org.apache.hadoop.fs.UnsupportedFileSystemException: No FileSystem for scheme "hdfs"
这个是因为hadoop版本从2升级到3后，hdfsclient的包有做改变，在2的版本为hadoop-hdfs，到3后改为hadoop-hdfs-client开头，拷贝到对应的目录即可。另外hadoop3还需要在core-site.xml里面配置：fs.hdfs.impl=org.apache.hadoop.hdfs.DistributedFileSystem

cp hadoop-hdfs-client-3.0.0-cdh6.2.1.jar /usr/local/webank/linkis/linkis-ujes-python-enginemanager/lib

gateway