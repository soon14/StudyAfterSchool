1. 打包时跳过依赖包
在依赖中添加<scope>provided</scope>
    <dependency>
        <groupId>org.apache.spark</groupId>
        <artifactId>spark-streaming_2.11</artifactId>
        <version>${spark.version}</version>
        <!--<scope>provided</scope>-->
    </dependency>