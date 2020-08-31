package org.example.hello.flink
import org.apache.flink.api.scala._

object WordCount {

  def main(args: Array[String]): Unit = {
    val environment = ExecutionEnvironment.getExecutionEnvironment
    val filePath = "D:\\workpalce\\scala\\flink-hello\\src\\main\\resources\\hello.text"
    val dataStream= environment.readTextFile(filePath = filePath)
    val word = dataStream.flatMap(_.split(" ")).map((_,1))
      .groupBy(0)
      .sum(1)

    word.print()

  }
}
