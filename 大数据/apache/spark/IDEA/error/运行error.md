error| 原因| 解决
-|-|-
Exception in thread "main" java.lang.NoSuchMethodError: scala.Predef$.$conforms()Lscala/Predef$$less$colon$less;| scala版本不匹配| spark依赖的版本和导入的scala的版本不匹配
org.apache.hadoop.util.NativeCrc32.nativeComputeChunkedSumsByteArray(II[BI[BIILjava/lang/String;JZ)V| 由于hadoop.dll 版本问题出现的| 2.4之前的和自后的需要的不一样，需要选择正确的版本(包括操作系统的版本),并且在 Hadoop/bin和 C：\windows\system32 上将其替换。下载地址：https://github.com/steveloughran/winutils

