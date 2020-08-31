```
# 安装
[root@vm-06 ~]# yum -y install postgresql-server
# 初始化
[root@vm-06 ~]# postgresql-setup initdb 
Initializing database ... OK
# 设置postgresql可被远程连接登录
[root@vm-06 ~]# vi /var/lib/pgsql/data/postgresql.conf
# 第59行取消注释，更改为：
listen_addresses = '*'
# 第395行，添加
log_line_prefix = '%t %u %d '
[root@vm-06 ~]# systemctl start postgresql  
[root@vm-06 ~]# systemctl enable postgresql 




设置PostgreSQL管理员用户的密码并添加一个用户并添加一个测试数据库。
[root@vm-06 ~]# su - postgres 
-bash-4.2$ psql -c "alter user postgres with password '123456'"
ALTER ROLE
-bash-4.2$ createuser devops
-bash-4.2$ createdb testdb -O devops
-bash-4.2$ exit
logout



vi /var/lib/pgsql/data/pg_hba.conf

根据下面信息进行配置
# This file controls: which hosts are allowed to connect, how clients
# are authenticated, which PostgreSQL user names they can use, which
# databases they can access.  Records take one of these forms:
#
# local      DATABASE  USER  METHOD  [OPTIONS]
# host       DATABASE  USER  ADDRESS  METHOD  [OPTIONS]
# hostssl    DATABASE  USER  ADDRESS  METHOD  [OPTIONS]
# hostnossl  DATABASE  USER  ADDRESS  METHOD  [OPTIONS]
#
# (The uppercase items must be replaced by actual values.)
#
# The first field is the connection type: "local" is a Unix-domain
# socket, "host" is either a plain or SSL-encrypted TCP/IP socket,
# "hostssl" is an SSL-encrypted TCP/IP socket, and "hostnossl" is a
# plain TCP/IP socket.
#
# DATABASE can be "all", "sameuser", "samerole", "replication", a
# database name, or a comma-separated list thereof. The "all"
# keyword does not match "replication". Access to replication
# must be enabled in a separate record (see example below).
#
# USER can be "all", a user name, a group name prefixed with "+", or a
# comma-separated list thereof.  In both the DATABASE and USER fields
# you can also write a file name prefixed with "@" to include names
# from a separate file.
#
# ADDRESS specifies the set of hosts the record matches.  It can be a
# host name, or it is made up of an IP address and a CIDR mask that is
# an integer (between 0 and 32 (IPv4) or 128 (IPv6) inclusive) that
# specifies the number of significant bits in the mask.  A host name
# that starts with a dot (.) matches a suffix of the actual host name.
# Alternatively, you can write an IP address and netmask in separate
# columns to specify the set of hosts.  Instead of a CIDR-address, you
# can write "samehost" to match any of the server's own IP addresses,
# or "samenet" to match any address in any subnet that the server is
# directly connected to.
#
# METHOD can be "trust", "reject", "md5", "password", "gss", "sspi",
# "krb5", "ident", "peer", "pam", "ldap", "radius" or "cert".  Note that
# "password" sends passwords in clear text; "md5" is preferred since
# it sends encrypted passwords.




示例：host    all             all             0.0.0.0/0               md5

```