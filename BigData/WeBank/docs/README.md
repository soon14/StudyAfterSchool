Linkis 编译需要scala环境

linkis-ujes-spark-engine 
需要更改spark版本和scala版本

例如
<details>
<summary>linkis-ujes-spark-engine pom文件</summary>

```
<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright 2019 WeBank
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~  you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  -->

<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <artifactId>linkis</artifactId>
        <groupId>com.webank.wedatasphere.linkis</groupId>
        <version>0.9.3</version>
    </parent>

    <artifactId>linkis-ujes-spark-engine</artifactId>
    <packaging>jar</packaging>
    <!--<version>${bdp.ide.version}</version>-->
    <!--<name>linkis-Spark-Engine</name>-->
    <properties>
        <spark.version>1.6.0-cdh5.13.2</spark.version>
    </properties>


    <dependencies>

        <dependency>
            <groupId>com.webank.wedatasphere.linkis</groupId>
            <artifactId>linkis-ujes-engine</artifactId>
            <version>${linkis.version}</version>
        </dependency>



        <dependency>
            <groupId>com.webank.wedatasphere.linkis</groupId>
            <artifactId>linkis-cloudRPC</artifactId>
            <version>${linkis.version}</version>
            <scope>provided</scope>
        </dependency>

        <dependency>
            <groupId>com.webank.wedatasphere.linkis</groupId>
            <artifactId>linkis-storage</artifactId>
            <version>${linkis.version}</version>
            <scope>provided</scope>
        </dependency>

        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-exec</artifactId>
            <version>1.3</version>
        </dependency>

        <dependency>
            <groupId>com.google.guava</groupId>
            <artifactId>guava</artifactId>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>com.webank.wedatasphere.linkis</groupId>
            <artifactId>linkis-bml-hook</artifactId>
            <version>${linkis.version}</version>
        </dependency>
        <dependency>
            <groupId>org.apache.spark</groupId>
            <artifactId>spark-core_2.10</artifactId>
            <version>${spark.version}</version>
            <scope>provided</scope>
            <exclusions>
                <!--<exclusion>-->
                <!--<groupId>org.apache.avro</groupId>-->
                <!--<artifactId>avro-mapred</artifactId>-->
                <!--</exclusion>-->
                <exclusion>
                    <groupId>com.twitter</groupId>
                    <artifactId>chill-java</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.twitter</groupId>
                    <artifactId>chill_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.hadoop</groupId>
                    <artifactId>hadoop-client</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-launcher_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-network-shuffle_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-unsafe_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-network-common_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <artifactId>tachyon-client</artifactId>
                    <groupId>org.tachyonproject</groupId>
                </exclusion>
                <exclusion>
                    <groupId>net.java.dev.jets3t</groupId>
                    <artifactId>jets3t</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.curator</groupId>
                    <artifactId>curator-recipes</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.eclipse.jetty.orbit</groupId>
                    <artifactId>javax.servlet</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.google.code.findbugs</groupId>
                    <artifactId>jsr305</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.ning</groupId>
                    <artifactId>compress-lzf</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.xerial.snappy</groupId>
                    <artifactId>snappy-java</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>net.jpountz.lz4</groupId>
                    <artifactId>lz4</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.roaringbitmap</groupId>
                    <artifactId>RoaringBitmap</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.typesafe.akka</groupId>
                    <artifactId>akka-remote_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.typesafe.akka</groupId>
                    <artifactId>akka-slf4j_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.sun.jersey</groupId>
                    <artifactId>jersey-server</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.sun.jersey</groupId>
                    <artifactId>jersey-core</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.mesos</groupId>
                    <artifactId>mesos</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.clearspring.analytics</groupId>
                    <artifactId>stream</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>io.dropwizard.metrics</groupId>
                    <artifactId>metrics-core</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>io.dropwizard.metrics</groupId>
                    <artifactId>metrics-jvm</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>io.dropwizard.metrics</groupId>
                    <artifactId>metrics-json</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>io.dropwizard.metrics</groupId>
                    <artifactId>metrics-graphite</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>com.fasterxml.jackson.module</groupId>
                    <artifactId>jackson-module-scala_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>oro</groupId>
                    <artifactId>oro</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>net.razorvine</groupId>
                    <artifactId>pyrolite</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.slf4j</groupId>
                    <artifactId>slf4j-log4j12</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.slf4j</groupId>
                    <artifactId>slf4j-api</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>org.apache.spark</groupId>
            <artifactId>spark-repl_2.10</artifactId>
            <version>${spark.version}</version>
            <scope>provided</scope>
            <exclusions>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpclient</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpcore</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.xbean</groupId>
                    <artifactId>xbean-asm5-shaded</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-mllib_${scala.binary.version}</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.spark</groupId>
                    <artifactId>spark-bagel_${scala.binary.version}</artifactId>
                </exclusion>
            </exclusions>
        </dependency>

        <dependency>
            <groupId>org.apache.spark</groupId>
            <artifactId>spark-sql_2.10</artifactId>
            <version>${spark.version}</version>
            <scope>provided</scope>
            <exclusions>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpclient</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpcore</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.parquet</groupId>
                    <artifactId>parquet-hadoop</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.parquet</groupId>
                    <artifactId>parquet-column</artifactId>
                </exclusion>
            </exclusions>
        </dependency>

        <dependency>
            <groupId>org.apache.spark</groupId>
            <artifactId>spark-yarn_2.10</artifactId>
            <version>${spark.version}</version>
            <scope>provided</scope>
            <exclusions>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpclient</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpcore</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.hadoop</groupId>
                    <artifactId>hadoop-yarn-common</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.hadoop</groupId>
                    <artifactId>hadoop-yarn-server-web-proxy</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.hadoop</groupId>
                    <artifactId>hadoop-yarn-client</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.apache.hadoop</groupId>
                    <artifactId>hadoop-yarn-api</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.slf4j</groupId>
                    <artifactId>slf4j-log4j12</artifactId>
                </exclusion>
                <exclusion>
                    <groupId>org.slf4j</groupId>
                    <artifactId>slf4j-api</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-deploy-plugin</artifactId>
            </plugin>

            <plugin>
                <groupId>net.alchim31.maven</groupId>
                <artifactId>scala-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
            </plugin>
            <plugin>
                <artifactId>maven-assembly-plugin</artifactId>
                <configuration>
                    <descriptorRefs>
                        <descriptorRef>jar-with-dependencies</descriptorRef>
                    </descriptorRefs>
                </configuration>
            </plugin>
        </plugins>
        <resources>
            <resource>
                <directory>${basedir}/src/main/resources</directory>
            </resource>
        </resources>
        <finalName>${project.artifactId}-${project.version}</finalName>
    </build>

</project>
```
</details>