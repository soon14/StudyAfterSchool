https://www.cnblogs.com/wx2276/p/11177265.html

(1).cm5.16.2默认安装的spark是1.6.4；如果要升级SPARK2是不用删除spark1.6可以同时安装两个spark(spark1和spark2)**注意spark2.2和saprk2.3是不可以存在两个的**

(2)下载SPARK2.4.0如下图三个包到/opt/cloudera/parcel-repo;SPARK2-2.4.0.cloudera2-1.cdh5.13.3.p0.1041012-el7.parcel.sha1改名为SPARK2-2.4.0.cloudera2-1.cdh5.13.3.p0.1041012-el7.parcel.sha;**注意原来CDH5.16.2的manifest.json文件要改名为manifest_CDH5.16.2.json；因为mainifest.json文件不可以有重名**

下载地址:http://archive.cloudera.com/spark2/parcels/latest/

(3)下载CSD文件到主服务器/opt/cloudera/csd目录下

下载地址:http://archive.cloudera.com/spark2/csd/

（4）重启cloudera-scm-server

systemctl restart cloudera-scm-server