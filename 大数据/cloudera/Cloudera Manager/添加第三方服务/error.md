错误| 原因| 解决
-|-|-
分配parcel包找不到| 之前分配出错没有清理干净| 删除/opt/cloudera/parcels/.flood 下之前分配的安装包
更新了CSD的jar包不起作用| CSD没有加载进来<br>| 需要重启cloudera manager systemctl restart cloudera-scm-server
{ service.roles[0].name must only contain upper case letters, numbers, and underscores }|sdl文件错误| 角色名称只能包含大写字母，数字，下划线