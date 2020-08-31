<!--
 * @Author: wjn
 * @Date: 2020-03-03 14:04:18
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-03 14:09:49
 -->
# 设置

## [设置编码](#code)

# sql

## [常用sql](常用sql.md)




## **<span id = code>设置编码</span>**

修改/etc/my.cnf或者/etc/mysql/my.cnf文件

    [client]
    default-character-set = utf8
    [mysqld]
    default-storage-engine = INNODB
    character-set-server = utf8
    collation-server = utf8_general_ci

重启mysql,使用mysql客户端检查编码

    show variables like '%char%';



