<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-15 14:39:01
--> 
1. Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.util.ProcessorUtils

缺少jetty-util* 

将包含jetty-util*的jar包添加到lib下


Caused by: java.lang.ClassNotFoundException: org.apache.hadoop.hive.ql.plan.TableDesc



import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;

依赖包

<dependency>
<groupId>commons-httpclient</groupId>
<artifactId>commons-httpclient</artifactId>
<version>3.1</version>
</dependency>

2. Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.util.ProcessorUtils

jetty-util-9.3.25.v20180904.jar 需要升级到 jetty-util-9.4.11.v20180605.jar



3. java.lang.NoClassDefFoundError: Lorg/apache/hadoop/hive/ql/plan/TableDesc;

集群运行spark sql缺失hive包，将hive依赖包添加到spark路径下

cp /opt/cloudera/parcels/CDH-6.2.1-1.cdh6.2.1.p0.1425774/lib/spark/hive/hive-exec-2.1.1-cdh6.2.1.jar /opt/cloudera/parcels/CDH-6.2.1-1.cdh6.2.1.p0.1425774/lib/spark/jars/



# spark

1. 报找不到hive相关jar包

只将hive-exec* 相关jar包放到spark依赖中

2. 报404 

只将hive-exec* 相关jar包放到spark依赖中，多余hivejar包会报异常

# work-flow

1. Failed to execute node of hql java.lang.NoSuchMethodError: org.jboss.netty.handler.codec.http.setHeader(Ljava/lang/String;Ljava/lang/Object;)V

async-http-client-1.8.10.jar 问题 netty* 问题

netty 版本过高，使用netty-3.2.4.Final.jar

        <!-- https://mvnrepository.com/artifact/org.jboss.netty/netty -->
        <dependency>
            <groupId>org.jboss.netty</groupId>
            <artifactId>netty</artifactId>
            <version>3.2.4.Final</version>
        </dependency>




java.lang.NoSuchMethodError: org.eclipse.jetty.util.Loader.loadClass(Ljava/lang/String;)Ljava/lang/Class;

mv jetty-util-9.3.25.v20180904.jar jetty-util-9.3.25.v20180904.jar.bak

