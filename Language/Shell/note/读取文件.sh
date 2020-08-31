###
 # @Author: wjn
 # @Date: 2020-07-08 17:28:46
 # @LastEditors: wjn
 # @LastEditTime: 2020-07-08 17:28:46
### 
#!/bin/bash

file=$1

while read line
do
    echo $line
done < $file