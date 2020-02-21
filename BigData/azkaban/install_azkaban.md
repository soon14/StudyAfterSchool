



cp -R azkaban-db ../
cp -R azkaban-exec-server ../
cp -R azkaban-web-server/ ../
cp -R azkaban-solo-server/ ../
cp -R azkaban-hadoop-security-plugin/ ../


# 创建数据库即初始化表结构

1. 修改mysql配置

    vi /etc/my.cnf

    [mysqld]
    max_allowed_packet=20M

    systemctl restart mysqld


    create database azkaban default character set utf8;
    CREATE USER 'azkaban'@'%' IDENTIFIED BY '123456';
    GRANT ALL PRIVILEGES ON metastore. * TO 'azkaban'@'%' IDENTIFIED by '123456';
    FLUSH PRIVILEGES;

2. 初始化表结构

运行azkaban-db* 目录下，create-all-sql*.sql 文件

use azkaban;
source create-all-sql-0.1.0-SNAPSHOT.sql

# 配置Azkaban-web-server

1. 复制azkaban-solo-server* 目录下的conf plugins 目录到azkaban-web-server*目录下

2. 修改conf/azkaban.properties 文件 数据库信息，监听端口，executor设置及插件目录配置





