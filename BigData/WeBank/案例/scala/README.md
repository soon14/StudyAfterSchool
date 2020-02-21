scala> val prop = new java.util.Properties;
scala> prop.setProperty("user", "*****");
scala> prop.setProperty("password", "*****");
scala> val tmp1 = spark.sql("select * from demo.da_t_finance_adds where (financetype = 'A?') and (financetype is null)");