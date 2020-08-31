package cn.edu360.day3

import java.net.URL

import org.apache.spark.rdd.RDD
import org.apache.spark.{SparkConf, SparkContext}

/**
  * Created by zx on 2017/10/8.
  */
object GroupFavTeacher2 {

  def main(args: Array[String]): Unit = {

    val topN = args(1).toInt

    val subjects = Array("bigdata", "javaee", "php")

    val conf = new SparkConf().setAppName("GroupFavTeacher2").setMaster("local[4]")
    val sc = new SparkContext(conf)

    //指定以后从哪里读取数据
    val lines: RDD[String] = sc.textFile(args(0))
    //整理数据
    val sbjectTeacherAndOne: RDD[((String, String), Int)] = lines.map(line => {
      val index = line.lastIndexOf("/")
      val teacher = line.substring(index + 1)
      val httpHost = line.substring(0, index)
      val subject = new URL(httpHost).getHost.split("[.]")(0)
      ((subject, teacher), 1)
    })

    //和一组合在一起(不好，调用了两次map方法)
    //val map: RDD[((String, String), Int)] = sbjectAndteacher.map((_, 1))

    //聚合，将学科和老师联合当做key
    val reduced: RDD[((String, String), Int)] = sbjectTeacherAndOne.reduceByKey(_+_)

    //cache到内存
    //val cached = reduced.cache()

    //scala的集合排序是在内存中进行的，但是内存有可能不够用
    //可以调用RDD的sortby方法，内存+磁盘进行排序

    for (sb <- subjects) {
      //该RDD中对应的数据仅有一个学科的数据（因为过滤过了）
      val filtered: RDD[((String, String), Int)] = reduced.filter(_._1._1 == sb)

      //现在调用的是RDD的sortBy方法，(take是一个action，会触发任务提交)
      val favTeacher = filtered.sortBy(_._2, false).take(topN)

      //打印
      println(favTeacher.toBuffer)
    }

    sc.stop()


  }
}
