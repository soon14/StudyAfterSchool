import org.apache.spark.sql.SaveMode
val df = spark.sql("select * from demo.da_t_finance_num")
// df.show()
val r = df.select($"dt",$"factory",bround($"value", scale=4).alias("RankPoint"))
r.write.format("jdbc")
    .mode(SaveMode.Overwrite)
    .option("url","jdbc:mysql://192.168.10.190:3306/demo?useUnicode=true&characterEncoding=utf8")
    .option("dbtable","t_finance_num")
    .option("user","root")
    .option("password","123456")
    .save()




