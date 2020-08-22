# hadoop
core-site.xml
<property><name>hadoop.proxyuser.livy.groups</name><value>*</value></property><property><name>hadoop.proxyuser.livy.hosts</name><value>*</value></property>

# Hive

hive.execution.engine  Spark


# Hue
hue_safety_valve.ini
[desktop]
app_blacklist=

[spark]
livy_server_host=node89
livy_server_port=8998
livy_server_session_kind=yarn

[notebook]
show_notebooks=true
enable_external_statements=true
enable_batch_execute=true


time_zone

Asia/Shanghai

scala 测试
```
var counter = 0
val data = Array(1, 2, 3, 4, 5)
var rdd = sc.parallelize(data)

// Wrong: Don't do this!!
rdd.map(x=>x+1).collect()
```



Solr server could not be contacted properly: HTTPConnectionPool(host='localhost', port=8983): Max retries exceeded with url: /solr/admin/info/system?user.name=hue&doAs=admin&wt=json (Caused by NewConnectionError(': Failed to establish a new connection: [Errno 111] Connection refused',))

# Oozie

oozie-site.xml 

<property><name>oozie.action.max.output.data</name><value>204800</value><description>解除输出限制</description></property><property><name>oozie.processing.timezone</name><value>GMT+0800</value><description>使用中国时区</description></property>



oozie admin -oozie http://node89:11000/oozie -sharelibupdate


# livy

mysql 驱动要复制到jar目录下，并重新创建session


