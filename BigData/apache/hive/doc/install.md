<!--
 * @Author: wjn
 * @Date: 2020-09-06 07:16:17
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:17:35
-->
local-hive-site.xml

```
<?xml version="1.0" encoding="UTF-8"?>  
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>  
 
<configuration>  
<property>  
  <name>hive.metastore.warehouse.dir</name> 
  <value>/user/hive/warehouse</value>  
  <description>数据库储存路径</description>
</property>  
   
<property>  
  <name>hive.metastore.local</name> 
  <value>true</value>
  <description>本地模式</description>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionURL</name> 
  <value>jdbc:mysql://127.0.0.1:3306/metastore?createDatabaseIfNotExist=true</value> 
  <description>所连接的 MySQL 数据库的地址</description>
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionDriverName</name>  
  <value>com.mysql.jdbc.Driver</value>  
  <description>MySQL 驱动</description>
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionUserName</name> 
  <value>hive</value>
  <description>数据库账户</description>
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionPassword</name> 
  <value>hive</value> 
  <description>数据库密码</description>
</property>  
</configuration> 
```

metastore配置
```
https://www.jianshu.com/p/802ae650a0eb


# Hive 的 metastore 安装方式共有三种
## 1)内嵌模式
使用内嵌的derby数据库储存元数据, 默认即为内嵌模式
运行hive会在当前目录生成一个derby文件和一个metastore_db目录
同一个目录下同时只能有一个hive客户端能使用数据库, 适合用来测试, 不适用于生产环境

需要在 Hive 根目录下的 conf 文件夹中创建 hive-site.xml 文件并添加如下配置:

```
<?xml version="1.0"?>  
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>  
  
<configuration>  
  
<property>  
  <name>javax.jdo.option.ConnectionURL</name>  
  <value>jdbc:derby:;databaseName=metastore_db;create=true</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionDriverName</name>  
  <value>org.apache.derby.jdbc.EmbeddedDriver</value>  
</property>  
   
<property>  
  <name>hive.metastore.local</name>  
  <value>true</value>  
</property>  
   
<property>  
  <name>hive.metastore.warehouse.dir</name>  
  <value>/user/hive/warehouse</value>  
</property>  
   
<property>  
  <name>hive.metastore.warehouse.dir</name>  
  <value>/user/hive/warehouse</value>  
</property>  
  
</configuration>  

```
## 2)本地模式
本地安装 MySQL替代 derby 存储元数据, 不再使用内嵌的 derby 作为元数据的存储介质，而是使用其他数据库比如 MySQL 来存储元数据

Hive 服务和 metastore 服务运行在同一个进程中, MySQL 是单独的进程, 可以同一台机器, 也可以在远程机器上

需要将 MySQL 的驱动 jar 包拷贝到 $HIVE_HOME/lib目录下, 并启动 MySQL 服务

hive-site.xml配置如下

```
<?xml version="1.0"?>  
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>  
  
<configuration>  
<property>  
  <name>hive.metastore.warehouse.dir</name>  //数据库储存路径
  <value>/user/hive/warehouse</value>  
</property>  
   
<property>  
  <name>hive.metastore.local</name>  //本地模式
  <value>true</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionURL</name>  //所连接的 MySQL 数据库的地址
  <value>jdbc:mysql://127.0.0.1:3306/metastore?createDatabaseIfNotExist=true</value>  //问号后固定格式防止定时任务报错
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionDriverName</name>  // MySQL 驱动
  <value>com.mysql.jdbc.Driver</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionUserName</name>  //数据库账户
  <value>hive</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionPassword</name>  //数据库密码
  <value>hive</value>  
</property>  
</configuration>  

```

## 3)远程模式(HiveServer2)
Hive 服务和 metastore 在不同的进程内, 可能是不同的机器, 该模式需要将 hive.metastore.uris 设置为 metastore 服务器URL

使用三台机器模拟:
host1 Mysql 服务端
host2 Hive 服务端
host3 Hive 客户端

需要修改 HIve 服务端和客户端的hive-site.xml配置文件

host2 下的hive-site.xml配置(服务端)

```
<?xml version="1.0"?>  
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>  
  
<configuration>  
<property>  
  <name>hive.metastore.warehouse.dir</name>  //数据库储存路径
  <value>/user/hive_remote/warehouse</value>  
</property>  
   
<property>  
  <name>hive.metastore.local</name>  //本地模式
  <value>true</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionURL</name>  //所连接的 MySQL 数据库的地址
  <value>jdbc:mysql://host1:3306/hive?createDatabaseIfNotExist=true</value>  //指定MySQL服务所在地址
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionDriverName</name>  // MySQL 驱动
  <value>com.mysql.jdbc.Driver</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionUserName</name>  //数据库账户
  <value>hive</value>  
</property>  
   
<property>  
  <name>javax.jdo.option.ConnectionPassword</name>  //数据库密码
  <value>password</value>  
</property>  
</configuration> 
``` 
host3 下的 hive-site.xml 配置(客户端)
```
<?xmlversion="1.0"?>
<?xml-stylesheettype="text/xsl" href="configuration.xsl"?>

<configuration>
<property>  
  <name>hive.metastore.warehouse.dir</name>  //数据库储存路径
  <value>/user/hive_remote/warehouse</value>  
</property>  
   
<property>  
  <name>hive.metastore.local</name>  //注意这里是false, 不是本地模式
  <value>false</value>  
</property>  
 
<property>  
  <name>hive.metastore.uris</name>  //注意这里是false, 不是本地模式
  <value>thrift://host2:9083</value>  
</property>  
</configuration>
```
如果有多个 metastore 服务器, 将 URL 之间用逗号分隔, metastore 服务器 URL 的格式为 thrift:host:port thrift://127.0.0.1:9083


```