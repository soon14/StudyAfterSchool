
# 适配CDH

# 编译

**版本修改**

    <hadoop.version>3.0.0-cdh6.2.1</hadoop.version>
    <hive.version>2.1.1-cdh6.2.1</hive.version>


    linkis-ujes-spark-engine模块

    <spark.version>2.4.0-cdh6.2.1</spark.version>
**添加cloudera库**

    <repositories>
        <repository>
            <id>cloudera</id>
            <url>https://repository.cloudera.com/artifactory/cloudera-repos/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
    </repositories>

**更改配置**

conf/db.sh

    MYSQL_HOST=192.168.10.190
    MYSQL_PORT=3306
    MYSQL_DB=linkis
    MYSQL_USER=linkis
    MYSQL_PASSWORD=123456

conf/config.sh

    gateway端口更改为9101


# 更改ldap逻辑

com.webank.wedatasphere.linkis.common.utils.LDAPUtils  
适配ldap前端，只需传入用户名即可，**baseDN需要定位到ou=People**
>val bindDN = userID 

更改为
> val bindDN = s"uid=$userID," + baseDN

# old

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>jetty-servlet</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>jetty-server</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>jetty-webapp</artifactId>
                </exclusion>



linkis-hadoop-common

    hadoop-common
    hadoop-hdfs

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

linkis-hive-engineManager


linkis-hive-engine

    hive-service

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

    hive-common

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

    hadoop-client

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

    hive-hbase-handler

                    <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>


linkis-hive-entrance







linkis-metadata

    hive-common

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

    添加依赖

        <dependency>
            <groupId>commons-httpclient</groupId>
            <artifactId>commons-httpclient</artifactId>
            <version>3.1</version>
        </dependency>        

linkis-resourcemanager-server

    hadoop-common

                <exclusion>
                    <groupId>org.eclipse.jetty</groupId>
                    <artifactId>*</artifactId>
                </exclusion>

linkis-ujes-spark-engine

    spark-core



spark

2.4.0-cdh6.2.1

hadoop

3.0.0-cdh6.2.1

hive

2.1.1-cdh6.2.1



排除assembly中的依赖

    <exclude>org.eclipse.jetty*</exclude>



1. 提交hive  java.lang.ClassNotFoundException: org.apache.hadoop.hive.ql.plan.TableDesc

移除jasper-相关包，还有javax.servlet.jsp相关包



    <repositories>
        <repository>
            <id>cloudera</id>
            <url>https://repository.cloudera.com/artifactory/cloudera-repos/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
    </repositories>







export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
#HADOOP  
export HADOOP_HOME=/opt/cloudera/parcels/CDH/lib/hadoop
export HADOOP_CONF_DIR=/etc/hadoop   
#Spark
export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
export SPARK_CONF_DIR=/etc/spark
#Hive
export HIVE_HOME=/opt/cloudera/parcels/CDH/lib/hive
export HIVE_CONF_DIR=/etc/hive