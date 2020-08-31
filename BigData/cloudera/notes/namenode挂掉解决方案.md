<!--
 * @Author: wjn
 * @Date: 2020-07-08 18:42:53
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-08 18:44:52
--> 
1. 将secondarynamenode服务所在的   /dfs/snn/current 全部拷贝到/dfs/nn


2. java.io.FileNotFoundException: /opt/dfs/nn/current/VERSION (Permission denied)

chown hdfs:hdfs -R /dfs/nn/*