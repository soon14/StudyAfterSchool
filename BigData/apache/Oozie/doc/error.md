<!--
 * @Author: wjn
 * @Date: 2020-09-06 07:21:18
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:23:54
-->


* 中文名文件编码问题 

        修改action-conf/default.xml (成功)
        
        <property><name>yarn.app.mapreduce.am.admin-command-opts</name><value>-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8</value></property>
        
        编码解释：
        sun.jnu.encoding   影响文件名
        file.encoding  影响文件内容


* 您是 Hue 管理员，但不是 HDFS 超级用户（即 "hdfs" 或 HDFS 超级组 "supergroup" 的一部分）。


        groupadd supergroup
        grep supergroup /etc/group
        usermod -a -G supergroup enfei   (useradd enfei)
        id enfei
        su hdfs   (失败，修改/etc/passwd)
        hdfs dfsadmin -refreshUserToGroupsMappings


* 容器内存不足

        调节
        yarn.nodemanager.resource.memory-mb
        yarn.scheduler.maximum-allocation-mb

 * is running beyond physical memory limits. Current usage: 1.1 GB of 1 GB physical memory used; 6.8 GB of 2.1 GB virtual memory used. Killing container.

        内存不足

* Stdoutput Warning: /opt/cloudera/parcels/CDH-5.13.2-1.cdh5.13.2.p0.3/bin/../lib/sqoop/../accumulo does not exist! Accumulo imports will fail.
Stdoutput Please set $ACCUMULO_HOME to the root of your Accumulo installation.

        原因：缺少accumulo目录

        shell 脚本中添加

        ```
        mkdir /var/lib/accumulo

        export ACCUMULO_HOME=/var/lib/accumulo
        ```


*  Job init failed : org.apache.hadoop.yarn.exceptions.YarnRuntimeException: java.io.FileNotFoundException: File does not exist: hdfs://nameservice1/user/zfw_ww/.staging/job_1567998333580_2703/job.splitmetainfo

        需要添加环境变量

        HADOOP_USER_NAME=${wf:user()}

        ![image]()
