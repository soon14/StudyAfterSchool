1. 启动任务失败（stage no tasks have started yet）

    点击executors查看日志

     ERROR client.RemoteDriver: Failed to run client job
     cluster.YarnClusterScheduler: Initial job has not accepted any resources; check your cluster UI to ensure that workers are registered and have sufficient resources

     内存不足
     核数分配过多



     容器虚拟 CPU 内核（yarn.nodemanager.resource.cpu-vcores）    最大允许分配核数
     容器内存（yarn.nodemanager.resource.memory-mb）最大允许分配内存



2. hive on spark 卡住不动

查看yarn资源，核数 和内存是否不够