import java.util.Properties
import org.apache.spark.sql.{DataFrame, SparkSession}

val prop = new Properties()
prop.setProperty("user","root")
prop.setProperty("password","123456")
val frame: DataFrame = spark.read.jdbc("jdbc:mysql://192.168.10.190:3306/demo","interval_analysis_d_t",prop)
// frame.show()

frame.write.mode("overwrite").saveAsTable("demo.ods_interval_analysis_d_t")