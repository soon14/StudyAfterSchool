create database metastore default character set utf8;
CREATE USER 'hive'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON metastore. * TO 'hive'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

create database cm default character set utf8;
CREATE USER 'cm'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON cm. * TO 'cm'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

create database am default character set utf8;
CREATE USER 'am'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON am. * TO 'am'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

create database rm default character set utf8;
CREATE USER 'rm'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON rm. * TO 'rm'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

create database hue default character set utf8;
CREATE USER 'hue'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON hue. * TO 'hue'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;

create database oozie  default character set utf8;
CREATE USER 'oozie'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON oozie. * TO 'oozie'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;