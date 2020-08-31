版本| 组件| 问题| 原因| 备注
-|-|-|-|-
6.2.1| hue|No child hadoop job is executed.java.lang.reflect.InvocationTargetExceptionCaused by: java.lang.SecurityException: Intercepted System.exit(0) | 未知 |







2. ERROR StatusLogger No log4j2 configuration file found. Using default configuration: logging only errors to the console. Set system property 'org.apache.logging.log4j.simplelog.StatusLogger.level' to TRACE to show Log4j2 internal initialization logging.



3. oozie中文名文件编码问题 action-conf/default.xml (成功)
yarn.app.mapreduce.am.admin-command-opts -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8


4. sqoop 找不到jdbc
所有节点sqoop/lib目录下添加jdbc驱动