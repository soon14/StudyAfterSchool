###
 # @Author: wjn
 # @Date: 2020-10-12 14:45:48
 # @LastEditors: wjn
 # @LastEditTime: 2020-10-12 14:45:50
### 
#!/bin/bash

dd=`date +%Y-%m-%d-%H-%M-%S`

#保存备份个数，备份7天数据
number=7
#备份保存路径
backup_dir=/home/data/mysqlDump/
#将要备份的数据库
database_name=morgana


#如果文件夹不存在则创建
if [ ! -d $backup_dir ]; 
then     
    mkdir -p $backup_dir; 
fi


mysqldump -u root -p123456 -x $database_name > $backup_dir/$database_name-$dd.sql

#写创建备份日志
echo "create $backup_dir/$database_name-$dd.dupm" >> $backup_dir/log.txt

#找出需要删除的备份
delfile=`ls -l -crt  $backup_dir/*.sql | awk '{print $9 }' | head -1`

#判断现在的备份数量是否大于$number
count=`ls -l -crt  $backup_dir/*.sql | awk '{print $9 }' | wc -l`

if [ $count -gt $number ]
then
  #删除最早生成的备份，只保留number数量的备份
  rm $delfile
  #写删除文件日志
  echo "delete $delfile" >> $backup_dir/log.txt
fi


