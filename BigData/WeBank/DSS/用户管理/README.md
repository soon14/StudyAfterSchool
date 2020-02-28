<!--
 * @Author: wjn
 * @Date: 2020-02-28 16:34:18
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-28 16:39:20
 -->


# 添加组

groupadd cs

# 添加用户

useradd -g cs cs

passwd cs  

cs123

# 同步到ldap

tail -1 /etc/passwd > people  

/usr/share/migrationtools/migrate_passwd.pl people people.ldif  

ldapadd -h ip-192.168.10.192.fd.com -x -W -D "cn=admin,dc=fd,dc=com" -f people.ldif

# 创建工作空间

mkdir /tmp/linkis/cs

chown -R cs:cs /tmp/linkis/cs