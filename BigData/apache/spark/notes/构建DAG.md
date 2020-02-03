有向无环图

* 描述了多个RDD之间的转换关系

* 任务执行时按照DAG的描述执行真正的计算（数据执行过程）

* DAG有边界：
    * 开始：　通过sparkContext创建的RDD
    * 结束：　触发action

* 一个SparkApplication 中有一个到多个DAG(取决于触发了多少此Action)

* 一个DAG中可能产生多种不同类型和功能的task(可以进行切分)

![image](https://github.com/wjn0918/Study/blob/master/%E5%A4%A7%E6%95%B0%E6%8D%AE/images/apache/spark/DAG.png)