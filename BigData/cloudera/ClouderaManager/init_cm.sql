-- 创建hive元数据库
create database metastore default character set utf8;
CREATE USER 'hive'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON metastore. * TO 'hive'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

-- 创建cm
create database cm default character set utf8;
CREATE USER 'cm'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON cm. * TO 'cm'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

-- 创建hue
create database hue default character set utf8;
CREATE USER 'hue'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON hue. * TO 'hue'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

-- 创建oozie
create database oozie  default character set utf8;
CREATE USER 'oozie'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON oozie. * TO 'oozie'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;