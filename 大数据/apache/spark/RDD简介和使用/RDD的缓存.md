RDD.cache()

使用场景: 
1. 要求计算结果快速返回
2. 集群资源较大
3. cache的数据会多次触发action
4. 先进行过滤，缩小范围的数据再cache到内存

缓存后会存在内存中（及放到一个进程中的集合或数组中），可以在storage中查看

DAG图中RDD非黑色表示RDD放入缓存中

sc.stop()会释放缓存

RDD会被反复使用时将RDD进行缓存(RDD中的数据会放到内存中)


# cache 部分数据


默认需要缓存的内存过大会只缓存部分数据

多个action调用同一部分数据，将该部分数据放入到缓存中，
在计算其他指标时需要缓存新的数据，之前的数据占用缓存，需要将之前缓存的数据释放掉

cachedRdd.unpersist(true)

true 表示数据释放完再进行操作
false 一边释放一边执行

1. cache 的数据大于内存大小

指定executor的内存大小   --executor-memory  1g        



以上数据均没有序列化，可以对数据进行序列化和压缩（不过需要反序列化和解压）

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/cache.png)


# 自定义

cache() 调用persist()方法，可以根据源码进行自定义
缓存磁盘的话会缓存到executor所在机器的磁盘


 
# tachyon 分布式内存文件系统  alluxio
