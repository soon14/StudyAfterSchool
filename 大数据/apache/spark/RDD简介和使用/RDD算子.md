# 常用Transformation(即转换，延迟加载)
# 通过并行化scala集合创建RDD
val rdd1 = sc.parallelize(Array(1,2,3,4,5,6,7,8))
# 查看该rdd的分区数量
rdd1.partitions.length


```
val rdd1 = sc.parallelize(List(5,6,4,7,3,8,2,9,1,10))
val rdd2 = sc.parallelize(List(5,6,4,7,3,8,2,9,1,10)).map(_*2).sortBy(x=>x,true)
val rdd3 = rdd2.filter(_>10)
val rdd2 = sc.parallelize(List(5,6,4,7,3,8,2,9,1,10)).map(_*2).sortBy(x=>x+"",true)
val rdd2 = sc.parallelize(List(5,6,4,7,3,8,2,9,1,10)).map(_*2).sortBy(x=>x.toString,true)
```

```
val rdd4 = sc.parallelize(Array("a b c", "d e f", "h i j"))
rdd4.flatMap(_.split(' ')).collect
```

```
val rdd5 = sc.parallelize(List(List("a b c", "a b b"),List("e f g", "a f g"), List("h i j", "a a b")))


List("a b c", "a b b") =List("a","b",))

rdd5.flatMap(_.flatMap(_.split(" "))).collect
```

# union求并集，注意类型要一致
```
val rdd6 = sc.parallelize(List(5,6,4,7))
val rdd7 = sc.parallelize(List(1,2,3,4))
val rdd8 = rdd6.union(rdd7)
rdd8.distinct.sortBy(x=>x).collect
```

# intersection求交集
```
val rdd9 = rdd6.intersection(rdd7)
```


# join(连接)
只按照key进行等值join
```
val rdd1 = sc.parallelize(List(("tom", 1), ("jerry", 2), ("kitty", 3)))
val rdd2 = sc.parallelize(List(("jerry", 9), ("tom", 8), ("shuke", 7), ("tom", 2)))

val rdd3 = rdd1.join(rdd2)
val rdd4 = rdd3.sortBy(_._2._2)
val rdd3 = rdd1.leftOuterJoin(rdd2)
val rdd3 = rdd1.rightOuterJoin(rdd2)
```

# groupByKey
val rdd3 = rdd1 union rdd2
rdd3.groupByKey
//(tom,CompactBuffer(1, 8, 2))
rdd3.groupByKey.map(x=>(x._1,x._2.sum))
groupByKey.mapValues(_.sum).collect
Array((tom,CompactBuffer(1, 8, 2)), (jerry,CompactBuffer(9, 2)), (shuke,CompactBuffer(7)), (kitty,CompactBuffer(3)))


# WordCount
sc.textFile("/root/words.txt").flatMap(x=>x.split(" ")).map((_,1)).reduceByKey(_+_).sortBy(_._2,false).collect
sc.textFile("/root/words.txt").flatMap(x=>x.split(" ")).map((_,1)).groupByKey.map(t=>(t._1, t._2.sum)).collect

# cogroup
val rdd1 = sc.parallelize(List(("tom", 1), ("tom", 2), ("jerry", 3), ("kitty", 2)))
val rdd2 = sc.parallelize(List(("jerry", 2), ("tom", 1), ("shuke", 2)))
val rdd3 = rdd1.cogroup(rdd2)
val rdd4 = rdd3.map(t=>(t._1, t._2._1.sum + t._2._2.sum))

# cartesian笛卡尔积
val rdd1 = sc.parallelize(List("tom", "jerry"))
val rdd2 = sc.parallelize(List("tom", "kitty", "shuke"))
val rdd3 = rdd1.cartesian(rdd2)

###################################################################################################

# spark action
action执行后不返回RDD，返回结果
val rdd1 = sc.parallelize(List(1,2,3,4,5), 2)

## collect
rdd1.collect

## reduce
val r = rdd1.reduce(_+_)

## count
rdd1.count

## top
rdd1.top(2)

## take
rdd1.take(2)

## first(similer to take(1))
rdd1.first

## takeOrdered
rdd1.takeOrdered(3)


## k v 转换
```
rdd2.map(x=>(x._2,x._1)).collect
```

## mapValues(_ * 100)
对value 进行操作





RDD| 说明|  类型
-|-|-
mapPartitionsWithIndex(func)| 一次拿出一个分区（分区中并没有数据，而是记录要读取哪些数据，真正生成的Task会读取多条数据），并且可以将分区的编号取出来<br>取分区中对应的数据时，还可以将分区的编号取出来，这样就可以知道数据是属于哪个分区的（哪个区分对应的Task的数据）| Transformation
aggregate(init_value)(_ + _, _ + _)| 聚合函数<br>init_value 表示聚合操作的初始值<br>(_ + _, _ + _) 逗号前分区内叠加，逗号后全局叠加，并且分区操作，全局操作都会累加初始值| Action
aggregateByKey(0)(_ + _, _ + _)| 只会在分区中累加初始值，不会在全局累加初始值|  Transformation
countByKey()| 按key进行计数|Action
filterByRange(min,max)| 对元组中的key进行过滤（按范围进行过滤，[]）| 
flatMapValues()|对value进行map操作|
foldByKey(init_value)(_ + _)| 进行聚合，并传入一个初始值| Transformation


aggregateByKey   是Transformation
reduceByKey      是Transformation
filter           是Transformation
flatMap			 是Transformation
map              是Transformation
mapPartition     是Transformation
mapPartitionWithIndex 是Transformation


collect          是Action
aggregate        是Action
saveAsTextFile   是Action
foreach          是Action
foreachPartition 是Action

# foreach vs foreachPartition
foreach 一条一条进行操作
foreachPartition 对一个分区进行操作
业务场景：将数据输出到数据库，若使用foreach ，则每条数据建立一个连接，而使用foreachPartition 则每个分区建立一条连接

val rdd = sc.parallelize(List(("cat", 2),("cat", 5), ("mouse", 4), ("mouse",1)))


reduceByKey vs groupByKey
reduceByKey首先会局部聚合，再进行全局聚合
groupByKey会有大量shuffle


# combineByKey
import scala.collection.mutable.ListBuffer
combineByKey(x => ListBuffer(x),(m: ListBuffer[String],n:String) => m += n ,(a:ListBuffer[String],b:ListBuffer[String]) => a ++= b)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/combineByKey.png)



