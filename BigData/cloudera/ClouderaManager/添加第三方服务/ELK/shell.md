# 环境说明
1. CDH6.2.1
2. ELK7.8.0

# 前期准备
1. 创建文件夹

> mkdir -p /usr/local/elk/ELK-7.8.0


2. 下载ELK并解压到/usr/local/elk/ELK-7.8.0

* [elasticsearch官方下载地址](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0-linux-x86_64.tar.gz)
* [kibana官方下载地址](https://artifacts.elastic.co/downloads/kibana/kibana-7.8.0-linux-x86_64.tar.gz)
* [logstash官方下载地址](https://artifacts.elastic.co/downloads/logstash/logstash-7.8.0.tar.gz)


# 解压
tar -xzvf elasticsearch-7.8.0.tar.gz
tar -xzvf kibana-7.8.0-linux-x86_64.tar.gz
tar -xzvf logstash-7.8.0.tar.gz

# 修改目录名称
mv elasticsearch-7.8.0 elasticsearch
mv kibana-7.8.0-linux-x86_64 kibana
mv logstash-7.8.0 logstash

# 修改权限
chmod -R 755 elasticsearch/jdk/
chmod 777 elasticsearch/plugins/
chmod 644 elasticsearch/config/*
chmod -R 777 kibana/optimize/
chmod 777 elasticsearch/bin/
chmod 777 kibana/bin/
chmod 777 logstash/bin/

# 修改文件内容

vi elasticsearch/config/jvm.options

![image](/Images/BigData/Cloudera/CDH/ClouderaManager/ELK/1.png)

vi kibana/src/legacy/server/logging/log_format_string.js
为了CM能解析日志
![image](/Images/BigData/Cloudera/CDH/ClouderaManager/ELK/2.png)



# 添加meta

# 打包

注意目录名称为ELK-7.8.0
版本需要和parcel.json 中对应

tar zcvf ELK-7.8.0-el7.parcel ELK-7.8.0/ --owner=root --group=root

python cm_ext/make_manifest/make_manifest.py ./



# 部署

重启cloudera-manager

systemctl restart cloudera-scm-server



# 配置更改
所有服务器
vi /etc/sysctl.conf
vm.max_map_count=262144

sysctl -p




最大进程文件描述符数
