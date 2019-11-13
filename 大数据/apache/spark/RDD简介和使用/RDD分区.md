默认rdd分区的数量和可用核数一致

创建rdd时可以指定分区数量
sc.paralize(List(1,2,3,4),RDD分区数量)

查看rdd分区数量
rdd.partitions.length

文件小于128M则一个文件就是一个输入切片(只有一个输入切片，默认分区为2)

设置允许最小分区为1,则不会在文件输入时对小于128M但远大于其他文件进行切分



分区中记录哪部分数据，每个分区对应一个task，一个executer中含有多个task,task会去读取真正的数据

# 更改分区
1. 创建rdd时指定分区
2. 进行shuffle时指定分区
进行shuffle时，需要指定一个partitioner，同时将其余参数传入
