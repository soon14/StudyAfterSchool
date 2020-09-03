关闭允许未声明的池 yarn.scheduler.fair.allow-undeclared-pools

默认为true，需要配置成false，设置为 true 时，将使用默认设置创建在应用程序中指定但未明确配置的池。设置为 false 时，将在名为 default 的池中运行应用程序指定的未明确配置的池。此设置适用于应用程序明确指定某个池时以及应用程序运行所在的池的名称为与该应用程序关联的用户名的情况。

关闭使用默认队列时的 Fair Scheduler 用户 yarn.scheduler.fair.user-as-default-queue

搜索yarn.scheduler.fair.user-as-default-queue，并设置为False，当设置为 true 时，如果未指定池名称，Fair Scheduler 将会使用用户名作为默认的池名称。当设置为 false 时，所有应用程序都在一个名为 default 的共享池中运行。


而且移动已经在执行任务的队列方法也非常方便只需要使用命令

hadoop2.0及以上版本可以通过下面命令 
yarn application -movetoqueue application_1478676388082_963529 -queue root.etl 


SET mapreduce.job.queuename=root.etl.distcp;

SET mapreduce.job.priority=HIGH;




% of Queue: 占资源池里面多少资源百分比。

% of Cluster: 占整个集群资源的百分比。