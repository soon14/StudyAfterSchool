<!--
 * @Author: wjn
 * @Date: 2020-02-02 22:17:08
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-23 11:24:22
 -->
# 流数据处理框架

Flink 主要特点：事件驱动

# Flink vs Spark Streaming

* 数据模型

    - Spark 采用RDD模型，Spark Streaming 的DStream实际上是一组组小批数据RDD集合
    - Flink 基本数据模型是数据路，以及事件序列

* 运行时架构

    - Spark 是批计算， 将DAG划分为不同的stage，一个完成后才可以计算下一个
    - Flink是标准的流执行模式，一个事件在一个节点处理完后可以直接发往下一个节点进行处理