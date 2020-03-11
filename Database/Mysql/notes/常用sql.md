<!--
 * @Author: wjn
 * @Date: 2020-02-05 14:57:30
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-11 11:28:33
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