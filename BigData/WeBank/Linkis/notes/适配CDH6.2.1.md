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