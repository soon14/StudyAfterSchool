<!--
 * @Author: wjn
 * @Date: 2020-09-30 14:34:54
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-30 14:36:16
-->
su root

密码：helowin



vi /etc/profile

```
export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2
 
export ORACLE_SID=helowin
 
export PATH=$ORACLE_HOME/bin:$PATH
```

ln -s $ORACLE_HOME/bin/sqlplus /usr/bin

su - oracle


sqlplus /nolog

conn /as sysdba



alter user system identified by system;

alter user sys identified by sys;

也可以创建用户  create user test identified by test;

    并给用户赋予权限  grant connect,resource,dba to test;


select instance_name from v$instance;/*查看sid*/