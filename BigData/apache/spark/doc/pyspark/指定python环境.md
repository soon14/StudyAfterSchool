<!--
 * @Author: wjn
 * @Date: 2020-09-09 01:38:49
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-09 01:43:50
-->

# 代码中指定

```
spark = SparkSession \
    .builder \
    .appName("PythonPi") \
    .config("spark.pyspark.python", "python/bin/python3.6") \
    .config("spark.pyspark.driver.python", "python3.6") \
    .config("spark.yarn.dist.archives", "hdfs://nameservice1/tmp/anaconda3.zip#python") \
    .config("spark.driver.memory", "2g") \
    .config("spark.executor.memory", "4g") \
    .getOrCreate()
```

# 永久配置


spark-conf/spark-env.sh  客户端

        export PYSPARK_PYTHON=/usr/local/python3/bin/python3
        export PYSPARK_DRIVER_PYTHON=/usr/local/python3/bin/python3