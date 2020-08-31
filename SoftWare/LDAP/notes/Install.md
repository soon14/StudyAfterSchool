# OpenLDAP

## 安装

    yum -y install openldap openldap-servers openldap-clients openldap-devel db4 db4-devel  pam_ldap nss-pam-ldapd


## 配置

准备DB配置文件 

* 需要先清空或备份系统中现有 OpenLDAP 数据库文件

        cp -a /var/lib/ldap /var/lib/ldap.bak
        rm -f  /var/lib/ldap/*  
        cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG  
        chown -R ldap:ldap /var/lib/ldap

* 准备密码
        
    slappasswd
        
    New password:

    Re-enter new password: #123456
    
{SSHA}USua/StMDEDZR6oPm2Xrgzna1UPGNewl

* 拷贝默认配置文件

        cp /usr/share/openldap-servers/slapd.ldif ./slapd.ldif 

**进行适当修改,记得注销 tls 相关的配置,否则会报错啊!!!**

134 144 145

```
#
# See slapd-config(5) for details on configuration options.
# This file should NOT be world readable.
#

dn: cn=config
objectClass: olcGlobal
cn: config
olcArgsFile: /var/run/openldap/slapd.args
olcPidFile: /var/run/openldap/slapd.pid
#
# TLS settings
#

# olcTLSCACertificatePath: /etc/openldap/certs
# olcTLSCertificateFile: "OpenLDAP Server"
# olcTLSCertificateKeyFile: /etc/openldap/certs/password

#
# Do not enable referrals until AFTER you have a working directory
# service AND an understanding of referrals.
#
#olcReferral: ldap://root.openldap.org
#
# Sample security restrictions
#	Require integrity protection (prevent hijacking)
#	Require 112-bit (3DES or better) encryption for updates
#	Require 64-bit encryption for simple bind
#
#olcSecurity: ssf=1 update_ssf=112 simple_bind=64


#
# Load dynamic backend modules:
# - modulepath is architecture dependent value (32/64-bit system)
# - back_sql.la backend requires openldap-servers-sql package
# - dyngroup.la and dynlist.la cannot be used at the same time
#

#dn: cn=module,cn=config
#objectClass: olcModuleList
#cn: module
#olcModulepath:	/usr/lib/openldap
#olcModulepath:	/usr/lib64/openldap
#olcModuleload: accesslog.la
#olcModuleload: auditlog.la
#olcModuleload: back_dnssrv.la
#olcModuleload: back_ldap.la
#olcModuleload: back_mdb.la
#olcModuleload: back_meta.la
#olcModuleload: back_null.la
#olcModuleload: back_passwd.la
#olcModuleload: back_relay.la
#olcModuleload: back_shell.la
#olcModuleload: back_sock.la
#olcModuleload: collect.la
#olcModuleload: constraint.la
#olcModuleload: dds.la
#olcModuleload: deref.la
#olcModuleload: dyngroup.la
#olcModuleload: dynlist.la
#olcModuleload: memberof.la
#olcModuleload: pcache.la
#olcModuleload: ppolicy.la
#olcModuleload: refint.la
#olcModuleload: retcode.la
#olcModuleload: rwm.la
#olcModuleload: seqmod.la
#olcModuleload: smbk5pwd.la
#olcModuleload: sssvlv.la
#olcModuleload: syncprov.la
#olcModuleload: translucent.la
#olcModuleload: unique.la
#olcModuleload: valsort.la


#
# Schema settings
#

dn: cn=schema,cn=config
objectClass: olcSchemaConfig
cn: schema

include: file:///etc/openldap/schema/core.ldif

#
# Frontend settings
#

dn: olcDatabase=frontend,cn=config
objectClass: olcDatabaseConfig
objectClass: olcFrontendConfig
olcDatabase: frontend
#
# Sample global access control policy:
#	Root DSE: allow anyone to read it
#	Subschema (sub)entry DSE: allow anyone to read it
#	Other DSEs:
#		Allow self write access
#		Allow authenticated users read access
#		Allow anonymous users to authenticate
#
#olcAccess: to dn.base="" by * read
#olcAccess: to dn.base="cn=Subschema" by * read
#olcAccess: to *
#	by self write
#	by users read
#	by anonymous auth
#
# if no access controls are present, the default policy
# allows anyone and everyone to read anything but restricts
# updates to rootdn.  (e.g., "access to * by * read")
#
# rootdn can always read and write EVERYTHING!
#

#
# Configuration database
#

dn: olcDatabase=config,cn=config
objectClass: olcDatabaseConfig
olcDatabase: config
olcAccess: to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,c
 n=auth" manage by * none


#
# Server status monitoring
#

dn: olcDatabase=monitor,cn=config
objectClass: olcDatabaseConfig
olcDatabase: monitor
olcAccess: to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,c
 n=auth" read by dn.base="cn=admin,dc=wjn,dc=com" read by * none



#
# Backend database definitions
#

dn: olcDatabase=hdb,cn=config
objectClass: olcDatabaseConfig
objectClass: olcHdbConfig
olcDatabase: hdb
olcSuffix: dc=wjn,dc=com
olcRootDN: cn=Manager,dc=wjn,dc=com
olcDbDirectory:	/var/lib/ldap
olcDbIndex: objectClass eq,pres
olcDbIndex: ou,cn,mail,surname,givenname eq,pres,sub
olcRootPW: {SSHA}Bz3GE/98rwk3cEOEDnpTKMsvNSBPYm40
```

这个配置一定要注意按照原配置文件的空行策略！！

导入配置文件

 
* 备份默认配置

    cp -a  /etc/openldap/slapd.d  /etc/openldap/slapd.d.default 

* 清空默认的配置目录

    rm -fr /etc/openldap/slapd.d/* 

* 导入配置文件

    slapadd -n 0 -F /etc/openldap/slapd.d -l ./slapd.ldif 

* 更改属主

    chown -R ldap:ldap /etc/openldap/* 

* 测试配置文件

    slaptest -u

    出现：config file testing succeeded 表示成功



## 启动

systemctl start slapd  
systemctl status slapd

# [CURD](/Study/blob/master/SoftWare/LDAP/CRUD.md)



# [客户端安装](http://www.ldapadmin.org/download/ldapadmin.html)

# [客户端使用](https://cloud.tencent.com/developer/article/1380076)



[参考地址1](https://www.cnblogs.com/HIBIKILinux/p/9799408.html)  
[参考地址2](https://www.cnblogs.com/lfdblog/p/9798004.html)
