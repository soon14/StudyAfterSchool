create database linkis default character set utf8;
CREATE USER 'linkis'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON linkis. * TO 'linkis'@'%' IDENTIFIED by '123456';
FLUSH PRIVILEGES;