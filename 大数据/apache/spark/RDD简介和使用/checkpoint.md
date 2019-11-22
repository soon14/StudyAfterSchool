数据存储位置：
    hdfs
写入时只需写一份，读取时可以并发读取

使用场景：
    * 迭代计算，数据不允许丢失，
    * 速度可以慢点
    * 中间结果保存到hdfs中

指定checkPoint目录（会自动创建）
sc.setCheckpoinDir("hdfs://master:9000/cp")

lazy的，需要action后才会存储
RDD.checkpoint 

可以将数据先放内存中，然后进行checkpoint，然后action，最后释放内存
