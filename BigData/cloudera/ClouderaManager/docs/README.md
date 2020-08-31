https://docs.cloudera.com/documentation/enterprise/latest/topics/cm_ig_reqs_space.html#concept_tjd_4yc_gr





1. No usable temporary directory found in %s" % dirlist

cd /
df -h 

查看是否/dev/mapper/centos-root  已满


2. 的内存被调拨过度。总内存分配额是 30.7 GiB 个字节，但是 RAM 只有 31.3 GiB 个字节（其中的 6.3 GiB 个字节是保留给系统使用的）

31.3 * 0.8 则为应该分配的最大内存

主机-> 资源
查看分配内存情况


3. 堆转储空间

4. https://docs.cloudera.com/documentation/enterprise/latest/topics/cm_ag_agent_config.html