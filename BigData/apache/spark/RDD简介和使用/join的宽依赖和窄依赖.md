通常情况join为宽依赖
先分组再进行join并没有改变分区数量和分区器,则是窄依赖

# 宽依赖

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/RDD的join.png)

# 窄依赖

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/RDD特殊的join.png)