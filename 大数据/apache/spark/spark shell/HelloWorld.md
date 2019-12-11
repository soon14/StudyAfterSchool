# Spark Shell
（是一个交互式的命令行，里面可以写spark程序，方便学习和测试，他也是一个客户端，用于提交spark应用程序）

```
/bigdata/spark-2.2.0-bin-hadoop2.7/bin/spark-shell
```
上面的方式没有指定master的地址，即用的是spark的local模式运行的（模拟的spark集群运行的过程）

```
/bigdata/spark-2.2.0-bin-hadoop2.7/bin/spark-shell --master spark://node-4:7077,node-5:7077
```
上面是指定了master的地址，那么就会将任务提交到集群，开始时sparksubmit（客户端）要连接Master，并申请计算资源（内存和核数），Master进行资源调度（就是让那些Worker启动Executor），在准备工作时，这些进程都已经创建好了

# 用spark Shell完成WordCount计算
启动HDFS(上传数据到hdfs)，sc是spark core（RDD）的执行入口
```
sc.textFile("hdfs://node-4:9000/wc").flatMap(_.split(" ")).map((_, 1)).reduceByKey(_+_).sortBy(_._2, false).collect
```


# PI

 --class org.apache.spark.examples.SparkPi 