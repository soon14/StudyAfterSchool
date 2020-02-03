[文档](https://www.cnblogs.com/metasequoia/p/5968315.html)

find命令的工作方式：沿着文件层次结构向下遍历，匹配符合条件的文件，并执行相应的操作。

# -maxdepth：
指定查找最大深度目录

```
find . -maxdepth 2
```
# -name：
指定文件名所必须匹配的字符串。支持通配符
```
find . -maxdepth 2 -name "src"
```

# -type: 

指定查找文件的类型
b 块设备

c 字符设备

d 目录

f 普通文件

l 符号链接

p FIFO

s 套接字
```
find . -maxdepth 2 -name "src" -type d
```