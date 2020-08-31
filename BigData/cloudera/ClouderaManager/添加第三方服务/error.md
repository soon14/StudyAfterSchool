<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-07 09:47:44
--> 
错误| 原因| 解决
-|-|-
分配parcel包找不到| 之前分配出错没有清理干净| 删除/opt/cloudera/parcels/.flood 下之前分配的安装包
更新了CSD的jar包不起作用| CSD没有加载进来<br>| 需要重启cloudera manager systemctl restart cloudera-scm-server
{ service.roles[0].name must only contain upper case letters, numbers, and underscores }|sdl文件错误| 角色名称只能包含大写字母，数字，下划线
 parcel.name custom.validation.constraints.ParcelName.message| parcel.json文件错误|
 部署了parcels找不到| manifest.json 文件缺失| python /opt/parcel_cs/cm_ext/make_manifest/make_manifest.py parcels所在目录
 .parcel 的错误：哈希验证失败。| httpd服务的问题|vim /etc/httpd/conf/httpd.conf <br>  添加<br>AddType application/x-gzip .gz .tgz .parcel #此处添加.parcel  <br>重启systemctl restart httpd
忽略命名不一致的包裹parcel|parcel 目录名称和parcel.json中定义的不一致|
Src file /opt/cloudera/parcels/.flood/  不存在 | 移除parcel-cache中分配失败的parcel|