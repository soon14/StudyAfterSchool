# rpm 包安装

## 下载地址

https://downloads.mysql.com/archives/community/

rpm -ivh **.rpm


1. 移除mariadb依赖
    
    yum remove mariadb-libs-*.el7.x86_64

2. 上传依赖包解压并安装

    rpm -ivh mysql-community-common-5.7.29-1.el7.x86_64.rpm 
    rpm -ivh mysql-community-libs-5.7.29-1.el7.x86_64.rpm 
    rpm -ivh mysql-community-client-5.7.29-1.el7.x86_64.rpm 
    rpm -ivh mysql-community-server-5.7.29-1.el7.x86_64.rpm
    rpm -ivh mysql-community-libs-compat-5.7.29-1.el7.x86_64.rpm
    rpm -ivh mysql-community-devel-5.7.29-1.el7.x86_64.rpm
    rpm -ivh mysql-community-embedded-5.7.29-1.el7.x86_64.rpm
    rpm -ivh mysql-community-embedded-compat-5.7.29-1.el7.x86_64.rpm
    rpm -ivh mysql-community-embedded-devel-5.7.29-1.el7.x86_64.rpm






# 设置密码等级

    systemctl start mysqld

## 查看初始密码

A temporary password is generated for root@localhost:

    more /var/log/mysqld.log | grep root@localhost

Lon4rswe:Js:

## 更改初始密码

ALTER USER USER() IDENTIFIED BY 'Wjn@@1234';

## 设置密码等级

* 密码等级
select @@validate_password_policy;
set global validate_password_policy=0;

* 密码长度

select @@validate_password_length;
set global validate_password_length=1;

* 密码大写，小写字母个数

select @@validate_password_mixed_case_count;
set global validate_password_mixed_case_count=0;

* 密码中数字个数

select @@validate_password_number_count;
set global validate_password_number_count=3;

* 整体查看

SHOW VARIABLES LIKE 'validate_password%';

* 更改密码

ALTER USER USER() IDENTIFIED BY '123456';


# 开启远程访问

grant all on *.* to root@'%' identified by '123456' with grant option;
flush privileges;




# 错误

1. /usr/bin/perl is needed by mysql-community-server

        yum -y install perl