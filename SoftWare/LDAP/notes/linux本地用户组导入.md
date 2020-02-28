<!--
 * @Author: wjn
 * @Date: 2020-02-19 10:18:36
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-28 11:04:12
 -->
yum install migrationtools -y
yum install openldap-clients -y

# 创建组

groupadd bd

# 创建用户并指定组

useradd -g bd wjn

# 导出用户

tail -1 /etc/passwd > people  
tail -1 /etc/group > group

# 使用migrationtools工具生成用户和组ldif文件

/usr/share/migrationtools/migrate_passwd.pl people people.ldif  
/usr/share/migrationtools/migrate_group.pl group group.ldif  

# 安装客户端

yum install openldap-clients



ldapadd -h ip-192.168.10.192.fd.com -x -W -D "cn=admin,dc=fd,dc=com" -f group.ldif