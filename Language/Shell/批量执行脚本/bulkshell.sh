#!/bin/bash

#判断传入的参数是否满足

if [ "$#" -ne 2 ]
  then
     echo "错误"
     exit
fi

#获取参数
#服务器信息文件
filename=$1
#传入执行的命令
cmd=$2

#获取当前目录
cwd=$(pwd)
cd $cwd

#构建文件全路径
serverlistfile="$cwd/$filename"

#判断此文件是否存在
if [ ! -e $serverlistfile ]
  then
     echo 'serverlistfile not exist';
     exit
fi

#读取文件内容进行循环处理
while read LINE
   do
      if [ -n "$LINE" ]
         then
             echo "********line***********" $LINE
             echo "********cmd************" $cmd
           #循环批量执行命令
           /usr/bin/expect /home/classwork/day3/bulkshell.expect $LINE "$cmd"
           #判断是否执行成功
           if [ $? -eq 0 ]
              then
                 echo $cmd "done!"
           else
                 echo "error: $?"
           fi
      fi
done < $serverlistfile















