groupadd supergroup
grep supergroup /etc/group
usermod -a -G supergroup enfei   (useradd enfei)
id enfei
su hdfs   (失败，修改/etc/passwd)
hdfs dfsadmin -refreshUserToGroupsMappings
