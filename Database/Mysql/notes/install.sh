###
 # @Author: wjn
 # @Date: 2020-03-05 16:35:58
 # @LastEditors: wjn
 # @LastEditTime: 2020-07-08 15:45:09
 ###
#!/bin/bash
####  将安装包mysql-5.7.29-1.el7.x86_64.rpm-bundle.tar.tar放到/tmp/mysql目录下
yum remove -y mariadb-libs-*.el7.x86_64

# mkdir
dir=/usr/local/mysql
function run_mkcurrent_dir(){
my_dir="$dir"

if [ ! -d "$my_dir" ]; then
        echo "创建文件夹"
        mkdir $my_dir
else
        echo "文件夹已存在"
fi
}

run_mkcurrent_dir;


# 解压

tar -xvf /tmp/mysql/mysql-5.7.29-1.el7.x86_64.rpm-bundle.tar.tar -C /usr/local/mysql

cd $dir

# install mysql start

rpm -ivh mysql-community-common-5.7.29-1.el7.x86_64.rpm 
rpm -ivh mysql-community-libs-5.7.29-1.el7.x86_64.rpm 
rpm -ivh mysql-community-client-5.7.29-1.el7.x86_64.rpm 
yum install -y perl
rpm -ivh mysql-community-server-5.7.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-compat-5.7.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-devel-5.7.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-embedded-5.7.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-embedded-compat-5.7.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-embedded-devel-5.7.29-1.el7.x86_64.rpm

# install mysql end



systemctl start mysqld
passwd=`cat /var/log/mysqld.log | grep root@localhost | awk -F "root@localhost: " '{print $2}'`
mysql -u root -p${passwd} 
