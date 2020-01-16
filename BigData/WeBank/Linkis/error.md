1. Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.util.ProcessorUtils

缺少jetty-util* 

将包含jetty-util*的jar包添加到lib下


Caused by: java.lang.ClassNotFoundException: org.apache.hadoop.hive.ql.plan.TableDesc



import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;

依赖包
<dependency>
<groupId>commons-httpclient</groupId>
<artifactId>commons-httpclient</artifactId>
<version>3.1</version>
</dependency>

2. Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.util.ProcessorUtils

jetty-util-9.3.25.v20180904.jar 需要升级到 jetty-util-9.4.11.v20180605.jar