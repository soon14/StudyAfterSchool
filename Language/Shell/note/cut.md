[参考](https://www.cnblogs.com/zwgblog/p/6006102.html)

cut命令可以从一个文本文件或者文本流中提取文本列。

-d  ：后面接分隔字符。与 -f 一起使用；  
-f  ：依据 -d 的分隔字符将一段信息分割成为数段，用 -f 取出第几段的意思；  
-c  ：以字符 (characters) 的单位取出固定字符区间；  
```
find . -maxdepth 2 -name "src" -type d|cut -d"/" -f2
```