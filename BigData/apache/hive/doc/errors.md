<!--
 * @Author: wjn
 * @Date: 2020-09-06 05:58:51
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:14:13
-->
*  KEY._col4:0._col0 is not in the vectorization context column 

解决：set hive.vectorized.execution.enabled=false

矢量查询(Vectorized query) 每次处理数据时会将1024行数据组成一个batch进行处理，而不是一行一行进行处理，这样能够显著提高执行速度。
可以通过设置

> set hive.vectorized.execution.enabled = true;
set hive.vectorized.execution.reduce.enabled = true;

* 导入数据都为NULL

> 建表分割符和数据分割符不一致

* User: root is not allowed to impersonate anonymous (state=08S01,code=0)

> https://www.cnblogs.com/lijinze-tsinghua/p/8563054.html

* org.apache.hadoop.security.AccessControlException: Permission denied: user=anonymous, access=EXECUTE, inode="/tmp":root:supergroup:drwx-w----


* 启动hive报错：java.lang.NoSuchMethodError: com.google.common.base.Preconditions.checkArgument(ZLjava/lang

        删除hive中低版本的guava-14.0.1.jar包，将hadoop(hadoop\share\hadoop\common\lib)中的guava-27.0-jre.jar复制到hive的lib目录下即可。
        https://blog.csdn.net/sinat_34439107/article/details/103914449          


* Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient

        首先进入hive/bin目录下

        执行命令   ./hive --service metastore &

        然后执行命令  ./hive

        成功进入hive数据库

        https://blog.csdn.net/qq_24309787/article/details/83859485

* 中文乱码

        1、进入数据库 Metastore 中执行以下 5 条 SQL 语句
        （1）修改表字段注解和表注解
        alter table COLUMNS_V2 modify column COMMENT varchar(256) character set utf8；
        alter table TABLE_PARAMS modify column PARAM_VALUE varchar(4000) character set utf8；

        （2）修改分区字段注解
        alter table PARTITION_PARAMS modify column PARAM_VALUE varchar(4000) character set utf8 ;
        alter table PARTITION_KEYS modify column PKEY_COMMENT varchar(4000) character set utf8;

        （3）修改索引注解
        alter table INDEX_PARAMS modify column PARAM_VALUE varchar(4000) character set utf8;


        2、修改 metastore 的连接 URL
        修改hive-site.xml配置文件
        <property>
            <name>javax.jdo.option.ConnectionURL</name>
            <value>jdbc:mysql://IP:3306/db_name?createDatabaseIfNotExist=true&amp;useUnicode=true&characterEncoding=UTF-8</value>
            <description>JDBC connect string for a JDBC metastore</description>
        </property>


 * Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.

        请注意:不建议在没有服务器身份验证的情况下建立SSL连接。根据MySQL 5.5.45+、5.6.26+和5.7.6+的要求，如果不设置显式选项，则必须建立默认的SSL连接。您需要通过设置useSSL=false显式地禁用SSL，或者设置useSSL=true并为服务器证书验证提供信任存储

        解决：

        设置useSSL=false
        这里有个坑就是hive的配置文件是.XML格式，而在xml文件中&amp；才表示&，所以正确的做法是在Hive的配置文件中，如hive-site.xml进行如下设置

        <property>
            <name>javax.jdo.option.ConnectionURL</name>
            <value>jdbc:mysql://localhost:3306/hive?createDatabaseIfNotExist=true&amp;useSSL=false</value>
            <description>JDBC connect string for a JDBC metastore</description>
        </property>
