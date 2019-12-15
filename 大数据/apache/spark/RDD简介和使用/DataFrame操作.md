# 构造一列

```
import org.apache.spark.sql.functions._

val value = udf(() => "未知")

dataFrame.withColumn(columnName,value())

```

# 转RDD
```
    import this.ss.implicits._
    val filteredNull: Dataset[Row] = oldData.filter(row => row.get(5).isInstanceOf[String])
    val idcardsRDD = filteredNull.select("WW_SFZH").map(row => {
      row.get(0).toString
    }).rdd

```