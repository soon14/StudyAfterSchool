<!--
 * @Author: wjn
 * @Date: 2020-09-06 07:06:30
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:06:32
-->
# Flink vs Spark Streaming

* 数据模型

    - Spark 采用RDD模型，Spark Streaming 的DStream实际上是一组组小批数据RDD集合
    - Flink 基本数据模型是数据路，以及事件序列

* 运行时架构

    - Spark 是批计算， 将DAG划分为不同的stage，一个完成后才可以计算下一个
    - Flink是标准的流执行模式，一个事件在一个节点处理完后可以直接发往下一个节点进行处理