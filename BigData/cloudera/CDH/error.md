<!--
 * @Author: wjn
 * @Date: 2020-07-09 09:17:52
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-09 10:09:06
--> 
1. 不良 : Canary 测试无法在目录 /tmp/.cloudera_health_monitoring_canary_files 中创建文件。

hdfs dfsadmin -safemode forceExit

查看当前的hdfs的块的状态
hdfs fsck /





2. Missing blocks
数据已经无法恢复，只能通过命令删除元数据来消除警告。
hdfs fsck  -delete 文件位置

hdfs fsck  -delete /hbase/oldWALs/ip-192.168.10.192.fd.com%2C16020%2C1587549905683.ip-192.168.10.192.fd.com%2C16020%2C1587549905683.regiongroup-0.1593569267383

3. Missing replicas

hdfs debug recoverLease -path 文件位置 -retries 重试次数