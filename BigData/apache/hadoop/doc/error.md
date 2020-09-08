<!--
 * @Author: wjn
 * @Date: 2020-09-08 09:48:08
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-08 14:44:39
-->
HADOOP_HOME and hadoop.home.dir are unset.

1. Datanode denied communication with namenode because hostname cannot be resolved

* Cannot initialize Cluster. Please check your configuration for mapreduce.framework.name and the correspond server addresses


        缺少hadoop-client依赖（hadoop3.0,其他版本查看对应的client）

* /bin/bash: line 0: fg: no job control

这个错误是 我本地idea 远程调试hadoop集群出现的

        方法一： 去把集群中的mapred-site配置添加
        <!--允许跨平台提交-->
        <property>
        <name>mapreduce.app-submission.cross-platform</name>
        <value>true</value>
        </property>
        
        方法二： 
        Configuration conf = new Configuration();
        conf.set("mapreduce.app-submission.cross-platform""true");//意思是跨平台提交，在windows下如果没有这句代码会报错 "/bin/bash: line 0: fg: no job control"，去网上搜答案很多都说是linux和windows环境不同导致的一般都是修改YarnRunner.java，但是其实添加了这行代码就可以了。