Linux服务器jps报process information unavailable

进入/tmp目录 cd /tmp 可以看到有很多以hsperfdata_{用户名}这样的目录，比如：hsperfdata_hbase，hsperfdata_kafka，hsperfdata_root这样的目录，是因为进程虽然在内存中关闭了，但是Linux还会在/tmp下寻找这些临时文件，而此时临时文件并没有没正常删除，这时候直接执行 rm -rf hsperfdata_* 删除这些目录，然后再次执行 jps 查看，以上那些进程就不存在了，