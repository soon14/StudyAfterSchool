# spark学习笔记

# spark vs MR
spark和MR都会将Shuffle的结果写入磁盘，不同的是，spark是将结果写入到本地磁盘，MR是写入到hdfs  
DAG 会将多个任务合并到一个中，MR需要写多个MR然后进行串联

spark任务执行流程


1. 构建DAG（调用RDD中的算子）

2. DAG scheduler将DAG切分为多个stage， 将stage中生成的task 以taskSet的形式发送给TaskScheduler（切分依据为shuffle）

3. TaskScheduler 调度task（根据资源情况将task 调度到相应的executor 中执行）

4. executor接收task ，然后将task丢入到线程池中执行

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/spark%E4%BB%BB%E5%8A%A1%E6%89%A7%E8%A1%8C%E8%BF%87%E7%A8%8B%E7%AE%80%E4%BB%8B.png)

task 由driver端生成触发action时发送到executor端



