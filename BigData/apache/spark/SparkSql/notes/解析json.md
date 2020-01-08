  ```
private val conf: SparkConf = new SparkConf().setAppName("cs").setMaster("local[4]")
  private val ss: SparkSession = SparkSession.builder().config(conf).getOrCreate()

  import ss.implicits._
  def dicMap(ele: JsonArray): Unit ={
    val data = Seq(ele.toString).toDS()
//    val data = Seq(ele).toDS()
    val df2 = ss.read.schema(ZFW_WW.GA_CZRKXX).json(data)
    val unit: Dataset[Row] = df2.filter($"GA_OID" isNotNull)
    unit.show()
  }
  ```

  # 获取元数据
  ```
  df2.schema.map(f=>f.name).mkString(",")
  ```

# 字符串拼接
  ```
  df2.foreachPartition(
      part => {
        part.foreach(
          row => {
            val r = row.toSeq.map("\"" + _  + "\"").mkString(",")
            println(r)

//            val isql = $"insert into $table ($names) values($row)"
//            println(isql)
          }

        )
  ```