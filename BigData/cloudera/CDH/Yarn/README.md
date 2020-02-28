<!--
 * @Author: wjn
 * @Date: 2020-02-26 18:13:49
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-26 18:17:11
 -->


# 配置

yarn.scheduler.fair.dynamic.max.assign为在assignmultiple为true时，是否动态决定一次分配多少，如果为true则一次最多分配该节点未分配资源的一半。

yarn.scheduler.fair.max.assign为在assignmultiple为true，且dynamic.max.assign为false时由此指定一次心跳分配请求最多分配多少，默认无限。



设置yarn.scheduler.fair.assignmultiple为false时明显看到已经分散的在多个节点进行了Container的分配



yarn.app.mapreduce.am.resource.mb ：AM能够申请的最大内存，默认值为1536MB

yarn.nodemanager.resource.memory-mb ：nodemanager能够申请的最大内存，默认值为8192MB

yarn.scheduler.minimum-allocation-mb ：调度时一个container能够申请的最小资源，默认值为1024MB

yarn.scheduler.maximum-allocation-mb ：调度时一个container能够申请的最大资源，默认值为8192MB