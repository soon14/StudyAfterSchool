```
import org.apache.spark.{SparkConf,SparkContext}

object WordCount {

  def main(args: Array[String]): Unit = {
    val conf = new SparkConf().setAppName("wjn_WordCount").setMaster("spark://master:7077")
    val sc = new SparkContext(conf)
    val lines = sc.textFile(args(0))
//    lines.flatMap( _.split("  ")).map((_,1)).reduceByKey( _ + _).sortBy(_._2).saveAsTextFile(args(1))
    val words = lines.flatMap( _.split("  "))
    val wordAndOne = words.map( (_,1))
    val reduced = wordAndOne.reduceByKey( _ + _)
    val sorted = reduced.sortBy( _._2, false)
    sorted.saveAsTextFile(args(1))
    sc.stop()

  }

}

```

