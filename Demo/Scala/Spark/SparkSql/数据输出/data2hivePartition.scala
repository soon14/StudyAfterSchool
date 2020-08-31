val hiveContext = new org.apache.spark.sql.hive.HiveContext(sc)
import hiveContext.implicits._
hiveContext.sql("use DataBaseName")
data.toDF().registerTempTable("table1")
hiveContext.sql("insert into table2 partition(date='2015-04-02') select name,col1,col2 from table1")