# [安装多个CDH版,会出现命令找不到,如hadoop,hdfs等等](http://blog.itpub.net/31451369/viewspace-2153699/)


1. 进/usr/bin/目录查看hadoop

> cd /usr/bin  
> ll hadoop  

lrwxrwxrwx 1 root root 24 Nov 17 19:25 hadoop -> /etc/alternatives/hadoop

* ####这个 软连接 一直在跳动,说明这个 原路径/etc/alternatives/hadoop 不存在，



2. 重新配置 hadoop的软连接，

* jps是由alternatives来动态管理的

> alternatives --config hadoop

```

There are 3 programs which provide 'hadoop'.

  Selection    Command
-----------------------------------------------
*+ 1           /opt/cloudera/parcels/CDH-5.4.8-1.cdh5.4.8.p0.4/bin/hadoop
   2           /opt/cloudera/parcels/CDH-4.7.1-1.cdh4.7.1.p0.47/bin/hadoop
   3           /opt/cloudera/parcels/CDH-5.8.2-1.cdh5.8.2.p0.3/bin/hadoop

Enter to keep the current selection[+], or type selection number: 3    #输入当前CDH集群的版本
```

3. 验证 hadoop
[root@hadoopnn-01 bin]# which hadoop
/usr/bin/hadoop
[root@hadoopnn-01 bin]#