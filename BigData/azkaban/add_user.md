修改azkaban-web-server-*-SNAPSHOT/conf/azkaban-user.xml文件
不需要重启服务
```
<azkaban-users>
  <user groups="azkaban" password="azkaban" roles="admin" username="azkaban"/>
  <user password="metrics" roles="metrics" username="metrics"/>

  # 添加 hadoop用户
  <user groups="azkaban" password="hadoop" roles="admin" username="hadoop"/>
  <role name="admin" permissions="ADMIN"/>
  <role name="metrics" permissions="METRICS"/>
</azkaban-users>

```