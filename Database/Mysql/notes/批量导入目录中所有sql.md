<!--
 * @Author: wjn
 * @Date: 2020-03-05 17:12:25
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-12 21:00:41
 -->

```
#!/bin/bash
dir=`ls module/` #定义遍历的目录，这个是你sql的存放路径
echo "" > all.sql  #创建一个总的sql文件，注意别跟你现有的重名即可！
for i in $dir
do
    echo "source module/$i;" >> all.sql
done

```


source all.sql;