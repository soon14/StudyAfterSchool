<!--
 * @Author: wjn
 * @Date: 2020-03-12 20:18:56
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-12 20:24:20
 -->
# sed -i 就是直接对文本文件进行操作的。

sed -i 's/原字符串/新字符串/' /home/1.txt
sed -i 's/原字符串/新字符串/g' /home/1.txt

就是把 home目录下 1.txt 中 的  “原字符” 替换成 “新字符”。

# 换行符替换成空格
```
sed -i ':a;N;s/\n/ /g;ta' 1.txt
```


# 向指定行插入
sed -i "25a# local clock\nserver 127.127.1.0\nfudge  127.127.1.0 stratum 10" /etc/ntp.conf


# 注释掉/取消注释server开头的行
sed 's/^server/#&/' cs 
sed 's/^#server/server/' cs