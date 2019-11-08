# RDD
Resilient Distributed DataSet  
弹性分布式数据集  
Resilient   弹性的，可恢复的  


/**
 * A Resilient Distributed Dataset (RDD), the basic abstraction in Spark. Represents an immutable,
 * partitioned collection of elements that can be operated on in parallel. This class contains the
 * basic operations available on all RDDs, such as `map`, `filter`, and `persist`. In addition,
 * [[org.apache.spark.rdd.PairRDDFunctions]] contains operations available only on RDDs of key-value
 * pairs, such as `groupByKey` and `join`;
 * [[org.apache.spark.rdd.DoubleRDDFunctions]] contains operations available only on RDDs of
 * Doubles; and
 * [[org.apache.spark.rdd.SequenceFileRDDFunctions]] contains operations available on RDDs that
 * can be saved as SequenceFiles.
 * All operations are automatically available on any RDD of the right type (e.g. RDD[(Int, Int)]
 * through implicit.
 *
 * Internally, each RDD is characterized by five main properties:
 *
 *  - A list of partitions
 *  - A function for computing each split
 *  - A list of dependencies on other RDDs
 *  - Optionally, a Partitioner for key-value RDDs (e.g. to say that the RDD is hash-partitioned)
 *  - Optionally, a list of preferred locations to compute each split on (e.g. block locations for
 *    an HDFS file)
 *
 * All of the scheduling and execution in Spark is done based on these methods, allowing each RDD
 * to implement its own way of computing itself. Indeed, users can implement custom RDDs (e.g. for
 * reading data from a new storage system) by overriding these functions. Please refer to the
 * <a href="http://people.csail.mit.edu/matei/papers/2012/nsdi_spark.pdf">Spark paper</a>
 * for more details on RDD internals.
 */
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