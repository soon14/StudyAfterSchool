[sed](#1)

用于去除某些特定行

grep

提取特定行


<span id="1">sed</span>

1. 删除
* 1,2行
```
sed '1,2d' 1.txt
```
* 1，2之外其它行
```
sed '1,2d!' 1.txt
```