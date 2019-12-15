```
val conf = new SparkConf().setAppName("demo").setMaster("local[4]")
val ss = SparkSession.builder().config(conf).getOrCreate()

ss.udf.register("名称",(参数) =>{

    函数体
})

ss.sql("select 名称(字段) from tableName")

```


例：同步身份证判断性别

```
    filterDF.createOrReplaceTempView("T_ZDMB_ZDRY")
    ss.udf.register("wzXb", (str: String) => {
      str.substring(17, 18).toInt % 2 match {
        case 0 => "女"
        case 1 => "男"
        case _ => "未知"
      }

    }
    )
    ss.sql("select wzXb(WW_SFZH) from T_ZDMB_ZDRY").show()
```