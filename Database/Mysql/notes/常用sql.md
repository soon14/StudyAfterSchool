<!--
 * @Author: wjn
 * @Date: 2020-02-05 14:57:30
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-11 09:51:01
 -->
# 创建数据库，用户，赋予远程访问权限

    create database linkis default character set utf8;
    CREATE USER 'linkis'@'%' IDENTIFIED BY '123456';
    GRANT ALL PRIVILEGES ON linkis. * TO 'linkis'@'%' IDENTIFIED by '123456';
    FLUSH PRIVILEGES;

# 配置密码策略

    set global validate_password_policy=0;
    set global validate_password_length=1;
    set global validate_password_mixed_case_count=0;
    set global validate_password_number_count=3;

# 生成36位uuid

```
CONCAT(SUBSTRING(MD5(RAND()),1,8),'-',SUBSTRING(MD5(RAND()),1,4),'-',SUBSTRING(MD5(RAND()),1,4),'-',SUBSTRING(MD5(RAND()),1,4),'-',SUBSTRING(MD5(RAND()),1,12))
```