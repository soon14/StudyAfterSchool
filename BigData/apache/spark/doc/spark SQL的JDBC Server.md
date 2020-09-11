<!--
 * @Author: wjn
 * @Date: 2020-09-09 05:49:37
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-09 05:52:08
-->
http://blog.chinaunix.net/uid-22570852-id-5186928.html


修改 hive-site.xml 文件

    <property>
    <name>hive.server2.thrift.bind.host</name>
    <value>192.168.1.100</value>
    </property>

启动spark SQL的JDBC server

    $ cd  spark/
    $ ln -s ./hive/conf/hive-site.xml hive-site.xml

    $ chmod- -R 777 spark/logs/

    $ cd spark/sbin
# 启动 thriftserver
    $ ./start-thriftserver.sh --master yarn --hiveconf hive.server2.thrift.port=10008
或者这样启动

    ./start-thriftserver.sh \
        --master yarn \
        --conf spark.shuffle.service.enabled=true \
        --conf spark.dynamicAllocation.enabled=true \
        --conf spark.dynamicAllocation.minExecutors=1 \
        --conf spark.dynamicAllocation.maxExecutors=10 \
        --hiveconf hive.server2.thrift.port=10008

beeline 连接JDBCServer

    [htestn@localhost bin]$ ./beeline -u jdbc:hive2://hadoop2.com:10008 -n htest
scan complete in 3ms
Connecting to jdbc:hive2://hadoop2.com:10008
Connected to: Spark SQL (version 1.4.0)
Driver: Spark Project Core (version 1.4.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
Beeline version 1.4.0 by Apache Hive
0: jdbc:hive2://hadoop2.com:10008> show databases;
+-----------+
| result |
+-----------+
| dp_tmp |
+-----------+
1 rows selected (1.132 seconds)

注：
如果是thrift server 权限问题 在连接的时候指定hadoop可操作的用户 ./beeline -u jdbc:hive2://2.hadoop.com:10008 -n htest（hadoop 账户）
