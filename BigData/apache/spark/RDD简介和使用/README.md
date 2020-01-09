# RDD
Resilient Distributed DataSet  
弹性分布式数据集  
Resilient   弹性的，可恢复的  
提交任务时，集群核数不够可以提交，内存不够无法提交
一个 application 中包含多个job

RDD里面记录的是描述信息（从哪里读取数据，对数据进行什么操作）

RDD的方法分为两类：Transformation（lazy），Action（生成task，并将task发送到executor中执行）

* 一系列分区（A list of partitions）
* 每一个输入切片会有一个函数作用在上面（A function for computing each split）
* RDD和RDD之间存在依赖关系（A list of dependencies on other RDDs）
* (可选)RDD中如果存储的是ｋｖ，shuffle时会有一个分区器（hash partitioner），Optionally, a Partitioner for key-value RDDs (e.g. to say that the RDD is hash-partitioned)Optionally, a Partitioner for key-value RDDs (e.g. to say that the RDD is hash-partitioned)
* (可选)如果RDD读取的HDFS中的数据，那么会有一个最优位置Optionally, a list of preferred locations to compute each split on (e.g. block locations for an HDFS file)

# RDD产生背景
![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/RDD产生背景.png)


1.RDD是一个基本的抽象，操作RDD就像操作一个本地集合一样，降低了编程的复杂度
RDD的算子分为两类，一类是Transformation（lazy），一类是Action（触发任务执行）
RDD不存真正要计算的数据，而是记录了RDD的转换关系（调用了什么方法，传入什么函数）

创建RDD有哪些中方式呢？

1. 通过外部的存储系统创建RDD
2. 将Driver的Scala集合通过并行化的方式编程RDD（试验、测验）
3. 调用一个已经存在了的RDD的Transformation，会生成一个新的RDD

RDD的Transformation的特点

1. lazy
2. 生成新的RDD

# collect 方法执行过程
collect 会将所有数据收集到driver端（慎用）=> 最好将executer的结果数据直接输出

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/collect.png)