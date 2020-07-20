<!--
 * @Author: wjn
 * @Date: 2020-07-08 17:17:53
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-08 17:18:08
--> 

#!/bin/bash

# 嵌入expect脚本
/usr/bin/expect << FLAGEOF
set timeout 2
spawn ssh-copy-id ip-192.168.10.19${i}.fd.com
expect {
        "(yes/no)" {send "yes\r"; exp_continue}
        "password:" {send "$password\r"}
}
sleep 2
spawn ssh ip-192.168.10.19${i}.fd.com
expect "root@*"  {send "hostname\r"}
sleep 1
expect "root@*"  {send "exit\r"}
expect eof 
FLAGEOF


done