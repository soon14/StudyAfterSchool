过程中有两种类型Task（ShuffleMapTask（相当于mr中的map）,ResultTask（相当于mr中的reduce））,一共4个Task task1和task2的业务逻辑相同，操作的数据不同  
Task的分水岭为Shuffle
Stage的分水岭也为Shuffle（需要等待上一个stage计算完成才能进行操作）
![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/SparkWordCount执行过程.png)