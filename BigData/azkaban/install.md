
[安装文档](https://github.com/azkaban/azkaban)

# 下载源码 解压

```
tar zxvf **.tar.gz -C /opt/azkaban 
unzip -d /opt/azkaban **.zip
```
# 编译
## 注意编译跳过测试
```
跳过测试
./gradlew clean
./gradlew build installDist -x test
```
# 拷贝tar包

```
ll /opt/azkaban/azkaban-master/azkaban-*/build/distributions/*.tar.gz

cp /opt/azkaban/azkaban-master/azkaban-*/build/distributions/*.tar.gz /opt/azkaban


```

# 解压

# 初始化MySQL

初始化MySQL的库、用户、权限、表、数据：

```
mysql -u root -p
CREATE DATABASE azkaban CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'azkaban'@'%' IDENTIFIED BY '填实际密码';
grant all privileges on azkaban.* to 'azkaban'@'%' identified by '123456';
flush privileges;
use azkaban;
source /u01/app/azkaban-3.50.0/azkaban-db-0.1.0-SNAPSHOT/create-all-sql-0.1.0-SNAPSHOT.sql;
```

# 配置SSL

```
keytool -keystore keystore -alias jetty -genkey -keyalg RSA
```
要输入密码的地方，都填相同密码。几个问题的回答，what … country code … ?填CN，Is … correct?填y，其他问题可以直接回车不填。。

完成上述工作后，将在当前目录生成 keystore 证书文件，将keystore移动到azkaban web服务器根目录中。

```
mv keystore /u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT
```

# 配置azkaban.properties

```
vi /u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/conf/azkaban.properties
```

```
# Azkaban Personalization Settings
#服务器UI名称,用于服务器上方显示的名字
azkaban.name=Test
#描述
azkaban.label=My Local Azkaban
#UI颜色
azkaban.color=#FF3601
azkaban.default.servlet.path=/index
#默认根web目录建议最好写绝对路径，以免出现找不到文件错误
web.resource.dir=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/web
#默认时区，已改为亚洲/上海，默认为美国
default.timezone.id=Asia/Shanghai
# Azkaban UserManager class
#用户权限管理默认类
user.manager.class=azkaban.user.XmlUserManager
#用户配置文件所在位置
user.manager.xml.file=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/conf/azkaban-users.xml
# Loader for projects
# global配置文件所在位置
executor.global.properties=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/conf/global.properties
azkaban.project.dir=projects
#数据库类型
database.type=mysql
#端口号
mysql.port=3306
#数据库连接IP
mysql.host=填实际IP
#数据库名
mysql.database=azkaban
#数据库用户名
mysql.user=azkaban
#数据库密码
mysql.password=填实际密码
#最大连接数
mysql.numconnections=100
# Azkaban Jetty server properties.
# Jetty服务器属性.
velocity.dev.mode=false
#最大线程数
jetty.maxThreads=25
#Jetty SSL端口
jetty.ssl.port=8443
#Jetty端口
jetty.port=8081
#SSL文件名
jetty.keystore=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/keystore
#SSL文件密码
jetty.password=填实际密码
#Jetty主密码 与 keystore文件相同
jetty.keypassword=填实际密码
#SSL文件名
jetty.truststore=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/keystore
# SSL文件密码
jetty.trustpassword=填实际密码
#jetty.use.ssl=false
jetty.maxThreads=25
# Azkaban Executor settings
executor.port=12321

# mail settings
mail.sender=
mail.host=
# User facing web server configurations used to construct the user facing server URLs. They are useful when there is a reverse proxy
 between Azkaban web servers and users.
# enduser -> myazkabanhost:443 -> proxy -> localhost:8081
# when this parameters set then these parameters are used to generate email links.
# if these parameters are not set then jetty.hostname, and jetty.port(if ssl configured jetty.ssl.port) are used.
# azkaban.webserver.external_hostname=myazkabanhost.com
# azkaban.webserver.external_ssl_port=443
# azkaban.webserver.external_port=8081
job.failure.email=
job.success.email=

lockdown.create.projects=false
cache.directory=cache
# JMX stats
jetty.connector.stats=true
executor.connector.stats=true
# Azkaban plugin settings
azkaban.jobtype.plugin.dir=/u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/plugins/jobtypes

```

# 配置commonprivate.properties

先创建配置文件：
```
mkdir -p /u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/plugins/jobtypes
vi /u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/plugins/jobtypes/commonprivate.properties 
```
输入以下内容：
```
azkaban.native.lib=false
execute.as.user=false
```

# 配置azkaban-users.xml

修改用户配置文件azkaban-users.xml：

vi /u01/app/azkaban-3.50.0/azkaban-web-server-0.1.0-SNAPSHOT/conf/azkaban-users.xml

增加admin用户：（在第4行）

```
<azkaban-users>
  <user groups="azkaban" password="azkaban" roles="admin" username="azkaban"/>
  <user password="azkaban" roles="metrics" username="metrics"/>
  <user username="admin" password="admin" roles="admin,metrics"/>

  <role name="admin" permissions="ADMIN"/>
  <role name="metrics" permissions="METRICS"/>
</azkaban-users>

```

# 配置executor

将 azkaban-web-server-0.1.0-SNAPSHOT目录下的conf拷贝到 azkaban-exec-server-0.1.0-SNAPSHOT

```
cd /u01/app/azkaban-3.50.0
cp -r azkaban-web-server-0.1.0-SNAPSHOT/conf azkaban-exec-server-0.1.0-SNAPSHOT
cp -r azkaban-web-server-0.1.0-SNAPSHOT/plugins azkaban-exec-server-0.1.0-SNAPSHOT

```

# 启动服务
## 启动Executor Server

进入azkaban-exec-server-0.1.0-SNAPSHOT下启动（注意不要进入bin目录启动）

```
./bin/start-exec.sh >logs/start.log 2>logs/error.log
```
查看JPS，会出现AzkabanExecutorServer：

##  启动Web Server

进入azkaban-web-server-0.1.0-SNAPSHOT下启动（注意不要进入bin目录启动）
```
./bin/start-web.sh >logs/start.log 2>logs/error.log
```

error 
1. lineNumber: 1; columnNumber: 1; Content is not allowed in prolog.

azkaban-users.xml 文件 开头添加(手动输入)
```
<?xml version="1.0" encoding="UTF-8"?>
```

2. Azkaban报错-azkaban.executor.ExecutorManagerException: No active executors found

需在MySQL数据库里设置端口为12321的executors表的active为1

3. javax.net.ssl.SSLException: Unrecognized SSL message, plaintext connection?

使用https


因为有日志输出建议使用nohup 执行

       启动azkaban web。进入web，执行：

              bin/azkaban-web-start.sh

              可以使用bin/ azkaban-web-shutdown.sh关闭

              建议使用nohup执行






1. Could not find Linker 'g++' in system path

>yum install -y gcc-c++*

2. Cannot run program "git" (in directory "/opt/azkaban/azkaban-master"): error=2, No such file or directory

> yum install git 

3. azkaban.utils.UtilsTest > testValidCronExpressionV FAILED

跳过测试
./gradlew clean
./gradlew build installDist -x test






[参考](https://blog.csdn.net/andyguan01_2/article/details/88173798)
