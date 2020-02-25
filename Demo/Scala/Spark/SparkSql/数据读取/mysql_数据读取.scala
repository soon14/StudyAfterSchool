package com.fd.linkis

import java.util.Properties

import org.apache.spark.sql.{DataFrame, SparkSession}


object Application {

  def main(args: Array[String]): Unit = {

    val ss = SparkSession.builder().appName("cs").master("local[4]").getOrCreate()
    val sql = s"SELECT * FROM interval_analysis_d_t "
    val prop = new Properties()
    prop.setProperty("user","root")
    prop.setProperty("password","123456")
    val frame: DataFrame = ss.read.jdbc("jdbc:mysql://192.168.10.190:3306/demo","interval_analysis_d_t",prop)
    frame.show()
  }


}
