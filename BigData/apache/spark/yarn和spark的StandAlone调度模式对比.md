|Yarn|Spark StandAlone|功能|
-|-|-
ResourceManager| Master| 管理子节点，资源调度，接收任务请求
NodeManager| Worker| 管理当前节点，管理子进程
YarnChild| Executor| 运行真正的计算逻辑（Task）
Client<br>ApplicationMaster| SparkSubmit|提交app，管理该任务的Executor，并将task提交到集群
