1. [java.lang.NoClassDefFoundError: org/apache/hadoop/fs/FSDataInputStream](https://www.cnblogs.com/yanghuabin/p/8329205.html)



从spark1.4以后，所有spark的编译都是没有将hadoop的classpath编译进去的，所以必须在spark-env.sh中指定hadoop中的所有jar包。

具体设置如下：

在spark-evn.sh中添加
export SPARK_DIST_CLASSPATH=$(hadoop classpath)


[官方解释](https://spark.apache.org/docs/latest/hadoop-provided.html#using-sparks-hadoop-free-build)

更改后未解决，在/etc/profile 中引入