error| 原因| 解决
-|-|-
Exception in thread "main" java.lang.NoSuchMethodError: scala.Predef$.$conforms()Lscala/Predef$$less$colon$less;| scala版本不匹配| spark依赖的版本和导入的scala的版本不匹配
org.apache.hadoop.util.NativeCrc32.nativeComputeChunkedSumsByteArray(II[BI[BIILjava/lang/String;JZ)V| 由于hadoop.dll 版本问题出现的| 2.4之前的和自后的需要的不一样，需要选择正确的版本(包括操作系统的版本),并且在 Hadoop/bin和 C：\windows\system32 上将其替换。[下载地址](https://github.com/steveloughran/winutils)
8032. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=10, sleepTime=1000 MILLISECONDS)| 本地配置文件和集群中的不一致（core-site.xml,yarn-site.xml,hdfs-site.xml）



2. java.lang.IllegalStateException make sure Spark is built.

添加依赖
```
    <!-- 指定hadoop-client API的版本 -->
    <!--<dependency>-->
        <!--<groupId>org.apache.hadoop</groupId>-->
        <!--<artifactId>hadoop-client</artifactId>-->
        <!--<version>${hadoop.version}</version>-->
    <!--</dependency>-->
```


3. java.lang.NoSuchMethodError: org.apache.hadoop.yarn.proto.YarnProtos$ResourceProtoOrBuilder.getMemory()I





