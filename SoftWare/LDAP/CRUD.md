# 添加组

vim add_group.ldif
```
# 创建企业管理目录
dn: dc=wjn,dc=com
o: wjn com
dc: wjn
objectClass: top
objectClass: dcObject
objectclass: organization

# 创建管理员
dn: cn=admin,dc=wjn,dc=com
cn: admin
objectClass: organizationalRole
description: Directory Manager

# 添加分组People
dn: ou=People,dc=wjn,dc=com
ou: People
objectClass: top
objectClass: organizationalUnit

# 添加分组Group
dn: ou=Group,dc=wjn,dc=com
ou: Group
objectClass: top
objectClass: organizationalUnit

```
  ldapadd -x -w "管理用户的密码" -D "cn=管理用户名,dc=wjn,dc=com" -f add_group.ldif
  
  出现下面内容表示添加成功：
  
      adding new entry "dc=wjn,dc=com"
      
      adding new entry "ou=People,dc=wjn,dc=com"

      adding new entry "ou=Group,dc=wjn,dc=com"

# 添加用户

vim add_user.ldif
```
# 添加用户
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
  ldapadd -x -w "管理用户的密码" -D "cn=管理用户名,dc=wjn,dc=com" -f add_group.ldif
