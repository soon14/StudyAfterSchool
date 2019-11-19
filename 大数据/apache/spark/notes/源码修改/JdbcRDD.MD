需求：
根据spark源码定义自己的JdbcRDD

1. 创建自己工具包,结构如下

    * common
        * utils

2. 创建自己的JdbcRDD类（WJdbcRDD）
    * common
        * utils
            * WJdbcRDD

![image]()

3. 将JdbcRDD中的内容复制到WJdbcRDD中

4. 将类名和伴生对象名称都改为WJdbcRDD


将引用到JdbcPartition 改为WJdbcPartition
