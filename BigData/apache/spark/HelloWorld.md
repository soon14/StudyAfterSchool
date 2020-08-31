# 提交第一个spark应用到集群中运行
```
bin/spark-submit --master spark://node-5:7077 --class org.apache.spark.examples.SparkPi examples/jars/spark-examples_2.11-2.2.0.jar 100
```


```
 bin/spark-submit --master spark://node-5:7077 --class org.apache.spark.examples.SparkPi --executor-memory 2048mb --total-executor-cores 12  examples/jars/spark-examples_2.11-2.2.0.jar 1000
```

>--executor-memory 每个executor使用的内存大小  
--total-executor-cores 整个app使用的核数

-----------------------------

提交一个spark程序到spark集群，会产生哪些进程？

SparkSubmint（Driver）提交任务
Executor 执行真正的计算任务的

# 提交任务可以指定多个master地址，目的是为了提交任务高可用

```
 bin/spark-submit --master spark://node-4:7077,node-5:7077 --class org.apache.spark.examples.SparkPi --executor-memory 2048mb --total-executor-cores 12  examples/jars/spark-examples_2.11-2.2.0.jar 1000
```