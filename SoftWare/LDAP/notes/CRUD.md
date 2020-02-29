# 添加组

vi add_group.ldif
```
# 创建企业管理目录
dn: dc=fd,dc=com
o: fd com
dc: fd
objectClass: top
objectClass: dcObject
objectclass: organization

# 创建管理员
dn: cn=admin,dc=fd,dc=com
cn: admin
objectClass: organizationalRole
description: Directory Manager

# 添加分组People
dn: ou=People,dc=fd,dc=com
ou: People
objectClass: top
objectClass: organizationalUnit

# 添加分组Group
dn: ou=Group,dc=fd,dc=com
ou: Group
objectClass: top
objectClass: organizationalUnit

```
  ldapadd -x -w "管理用户的密码" -D "cn=管理用户名,dc=wjn,dc=com" -f add_group.ldif

    ldapadd -x -w "123456" -D "cn=admin,dc=fd,dc=com" -f add_group.ldif
  
  出现下面内容表示添加成功：
  
      adding new entry "dc=wjn,dc=com"
      
      adding new entry "ou=People,dc=wjn,dc=com"

      adding new entry "ou=Group,dc=wjn,dc=com"

# 添加用户

vim add_user.ldif
```

dn: uid=zhangsan,ou=people,dc=fd,dc=com
uid: zhangsan
cn: zhangsan
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
userPassword: 123456
loginShell: /bin/bash
uidNumber: 10007
gidNumber: 10002
homeDirectory: /home/zhangsan
mail: zhangsan@fd.com

```
  ldapadd -x -w "管理用户的密码" -D "cn=管理用户名,dc=wjn,dc=com" -f add_group.ldif


ldapadd -x -w "123456" -D "cn=admin,dc=fd,dc=com" -f add_user.ldif

ldapsearch -LLL -x -D 'cn=admin,dc=fd,dc=com' -W "123456" -b 'dc=fd,dc=com' 'uid=zhangsan'  



dn: uid=root,ou=People,dc=fd,dc=com
uid: root
cn: root
objectClass: account
objectClass: posixAccount
objectClass: top
objectClass: shadowAccount
userPassword: {crypt}$6$L/7fR0zduULPLhjT$RTS6F6YX.Kdi.De/G2oHtEMIAW/UfFyRFciVu/sfjso11Lvizt8AvEBW4.Y.7c73J7uN0fIel2aE65VjYXEYu/
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash
uidNumber: 0
gidNumber: 0
homeDirectory: /root
gecos: root
