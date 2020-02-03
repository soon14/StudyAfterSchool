# 使用pyspark连接mongodb

[文档](https://github.com/mongodb/mongo-hadoop/blob/master/spark/src/main/python/README.rst)

启动

```
pyspark --jars mongo-hadoop-master-2.0.2.jar --driver-class-path mongo-hadoop-master-2.0.2.jar --py-files pymongo_spark.py
```

直接将jar包放入到D:\Sdk\Python3\Lib\site-packages\pyspark\jars 目录下及 pyspark的class路径

如果是spark集群则将jar包放入到D:\soft\apache\spark-2.4.4-bin-hadoop2.7\jars目录下

注意 需要指定--py-files pymongo_spark.py  

import pymongo_spark
# Important: activate pymongo_spark.
pymongo_spark.activate()


激活后才能使用

