我的原因是，打开tmp找到文件，发现hsperfdata文件权限全部是777，使用命令

chmod 755 hsperfdata_*

修改为755，再次使用jps，问题解决