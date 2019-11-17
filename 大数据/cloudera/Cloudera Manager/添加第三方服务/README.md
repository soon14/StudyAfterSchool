# [Cloudera Manager Extensions](https://github.com/cloudera/cm_ext/wiki)
## [Parcels: Deploying services](https://github.com/cloudera/cm_ext/wiki/Parcels%3A-What-and-Why%3F)

.parcel文件  
tar -czvf FLINK-1.9.0-el7.parcel FLINK-1.9.0

.parcel.sha文件

sha1sum  FLINK-1.9.0-el7.parcel | awk '{ print $1 }' > FLINK-1.9.0-el7.parcel.sha
[官网](https://docs.cloudera.com/documentation/enterprise/5-14-x/topics/cm_ig_create_local_parcel_repo.html)


manifest.json
python /opt/parcel_cs/cm_ext/make_manifest/make_manifest.py parcel-el7/


## [CSD: Managing and monitoring services](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)

[CSD（Custom Service Descriptor） 开发者文档](https://github.com/cloudera/cm_ext/wiki/CSD-Developer-Tricks-and-Tools)




 service descriptor language (SDL)

jar -cvf FLINK-1.9.0.jar *
mv FLINK-1.9.0.jar /opt/cloudera/csd/
更新后需要重启服务
systemctl restart cloudera-scm-server

[service.mdl 语法](https://github.com/cloudera/cm_ext/wiki/Service-Monitoring-Descriptor-Language-Reference)


根据此Parcel生成一个hash校验文件，并修改Parcel文件和校验文件的属组与权限。
* sha1sum 名称.parcel | cut -d ' ' -f 1 > 名称.parcel.sha
* chown cloudera-scm:cloudera-scm  名称.parcel 名称.parcel.sha
* chmod 640 名称.parcel 名称.parcel.sha


1. 使用Cloudera Manger安装Parcel一共有三种方式包括：默认的公网仓库，自搭本地的http仓库和直接利用CM这个节点上的/opt/cloudera/parcel-repo目录。

2. 注意要手动生成一个hash校验文件后缀为sha，否则Cloudera Manger可以看到这个新的Parcel，但会报错缺少hash文件，会导致无法分配激活安装。

3. Cloudera Manger发现新的Parcel需要等待一小会时间，在/opt/cloudera/parcel-repo目录下会生成一个torrent文件。

# 制作相关介绍
名词介绍
parcel:以“.parcel”结尾的gz格式的压缩文件。它必须为一个固定规则的文件名。

命名规则必须如下：

文件名称格式为三段，第一段是包名，第二段是版本号，第三段是运行平台。

例如：FLINK-1.6.0-hadoop_2.6-scala_2.11-el7.parcel

包名：FLINK

版本号：1.6.0-hadoop_2.6-scala_2.11

运行环境：el7

el6是代表centos6系统，centos7则用el7表示

parcel包内包含了你的服务组件，同时包含一个重要的描述性文件parcel.json：

这个文件记录了你的服务信息，如版本、所属用户、适用的CDH平台版本等

parcel必须包置于/opt/cloudera/parcel-repo/目录下才可以被CDH发布程序时识别到。

csd：csd文件是一个jar包，它记录了你的服务在CDH上的管理规则

如你的服务在CDH页面上显示的图标、依赖的服务、暴露的端口、启动规则等。

csd的jar包必须置于/opt/cloudera/csd/目录才可以在添加集群服务时被识别到。






[What is Parcel](https://github.com/cloudera/cm_ext/wiki/Parcels%3A-What-and-Why%3F)

[parcel.json Example](https://github.com/cloudera/cm_ext/wiki/The-parcel.json-file)

[service.sdl Example](https://github.com/cloudera/cm_ext/wiki/Service-Descriptor-Language-Reference)


[Flink制作好链接](https://gitee.com/tony429001986/flink-cdh/tree/master/flink)


参数| 说明
-|-
depends| 列出必须存在的包裹，使这个包裹发挥作用。在出现依赖项之前，无法激活此包。
replaces| 列出被这个包裹替换的包裹。在替换的包裹被移除之前，此包裹无法激活
conflicts| 列出与此包裹冲突的包裹。一次只能激活一个冲突包。
scripts| 指定cloudera manager使用的脚本


分配错误后需要删除/opt/cloudera/parcels/.flood 下之前分配的安装包










