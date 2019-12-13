需求：
根据spark源码定义自己的JdbcRDD

1. 创建自己工具包,结构如下

    * common
        * utils

2. 创建自己的JdbcRDD类（WJdbcRDD）
    * common
        * utils
            * WJdbcRDD

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_1.png)

3. 将JdbcRDD中的内容复制到WJdbcRDD中

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_2.png)

4. 将类名和伴生对象名称都改为WJdbcRDD

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_3_1.png)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_3_2.png)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_3_3.png)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_3_4.png)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_4.png)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/c_jdbcRdd_5.png)



5. 更改分区算法

```
private[common] class MJdbcPartition(idx: Int) extends Partition {
  override def index: Int = idx
}

override def getPartitions: Array[Partition] = {
    // bounds are inclusive, hence the + 1 here and - 1 on end
//    val length = BigInt(1) + upperBound - lowerBound
    (0 until numPartitions).map { i =>
//      val start = lowerBound + ((i * length) / numPartitions)
//      val end = lowerBound + (((i + 1) * length) / numPartitions) - 1
      new MJdbcPartition(i)
    }.toArray
  }

```

