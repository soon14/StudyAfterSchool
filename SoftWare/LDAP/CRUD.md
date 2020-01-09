# 添加组

```
dn: dc=wjn,dc=com
o: ilan com
dc: wjn
objectClass: top
objectClass: dcObject
objectclass: organization

dn: cn=admin,dc=wjn,dc=com
cn: admin
objectClass: organizationalRole
description: Directory Manager

dn: ou=People,dc=wjn,dc=com
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=Group,dc=wjn,dc=com
ou: Group
objectClass: top
objectClass: organizationalUnit


```


# 添加用户

```
dn: uid=zhangsan,ou=People,dc=wjn,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
cn: zhangsan
sn: zhangsan
userPassword: 123456
loginShell: /bin/bash
uidNumber: 10007
gidNumber: 10002
homeDirectory: /home/zhangsan
mail: zhangsan@wjn.com

```