1.  KEY._col4:0._col0 is not in the vectorization context column 

解决：set hive.vectorized.execution.enabled=false

矢量查询(Vectorized query) 每次处理数据时会将1024行数据组成一个batch进行处理，而不是一行一行进行处理，这样能够显著提高执行速度。
可以通过设置

> set hive.vectorized.execution.enabled = true;
set hive.vectorized.execution.reduce.enabled = true;