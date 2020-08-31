# CDH集群安装Anaconda

使用Parcel包的方式在CDH集群安装Anaconda，
下载地址：

https://repo.continuum.io/pkgs/misc/parcels/

根据自己操作系统版本选择Parcel包

1. 部署Anaconda的Parcel包http访问

    下载Anaconda的Parcel包，下载地址如下
https://repo.continuum.io/pkgs/misc/parcels/Anaconda-4.2.0-el6.parcel
https://repo.continuum.io/pkgs/misc/parcels/Anaconda-4.2.0-el6.parcel.sha
https://repo.continuum.io/pkgs/misc/parcels/manifest.json

2. 将上述3个文件下载至HTTP所在服务器的/var/www/html/anaconda4.2.0目录下

        [root@ip-172-31-6-148 html]# mkdir -p anaconda4.2.0/
        [root@ip-172-31-6-148 html]# cd anaconda4.2.0/
        [root@ip-172-31-6-148 anaconda4.2.0]# ll
        total 541416
        -rw-r--r-- 1 root root 554396033 Jun 19 17:47 Anaconda-4.2.0-el6.parcel
        -rw-r--r-- 1 root root        41 Jul  7 19:43 Anaconda-4.2.0-el6.parcel.sha
        -rw-r--r-- 1 root root      3890 Jul  7 19:43 manifest.json
        [root@ip-172-31-6-148 anaconda4.2.0]# 



3. 验证http是否正常访问


## 安装Anaconda

1. 配置Anaconda的parcels包访问地址


2. 点击下载、分配并激活


3. 配置Anaconda环境变量

    Anaconda默认安装在/opt/cloudera/parcels/Anaconda目录，在集群所有节点配置Anaconda的环境变量，操作如下：

    使用root用户或有sudo权限用户编辑/etc/profile文件，在文件末尾增加如下配置
    
        export ANACONDA_HOME=/opt/cloudera/parcels/Anaconda
        export PATH=$ANACONDA_HOME/bin:$PATH

    执行source命令，使环境变量立即生效

        [root@ip-172-31-6-148 anaconda4.2.0]# source /etc/profile

4. 验证环境变量是否配置成功

        [root@ip-172-31-6-148 anaconda4.2.0]# python
        Python 2.7.12 |Anaconda 4.2.0 (64-bit)| (default, Jul  2 2016, 17:42:40) 
        [GCC 4.4.7 20120313 (Red Hat 4.4.7-1)] on linux2
        Type "help", "copyright", "credits" or "license" for more information.
        Anaconda is brought to you by Continuum Analytics.
        Please check out: http://continuum.io/thanks and https://anaconda.org

