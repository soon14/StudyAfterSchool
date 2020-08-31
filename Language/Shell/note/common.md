<!--
 * @Author: wjn
 * @Date: 2020-03-10 17:55:26
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-10 17:55:48
 -->
# sed -i 就是直接对文本文件进行操作的。

sed -i 's/原字符串/新字符串/' /home/1.txt
sed -i 's/原字符串/新字符串/g' /home/1.txt

就是把 home目录下 1.txt 中 的  “原字符” 替换成 “新字符”。