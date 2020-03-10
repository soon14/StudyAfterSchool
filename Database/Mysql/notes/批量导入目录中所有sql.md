<!--
 * @Author: wjn
 * @Date: 2020-03-05 17:12:25
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-05 17:12:39
 -->

```
#!/bin/bash
dir=`ls ~/tmp/` #定义遍历的目录，这个是你sql的存放路径
echo "" > all.sql  #创建一个总的sql文件，注意别跟你现有的重名即可！
for i in $dir
do
    echo "source ~/tmp/$i;" >> all.sql
done

```


source ~/tmp/all.sql;