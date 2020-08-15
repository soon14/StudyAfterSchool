#!/bin/bash

# 定义主机列表
# HOSTS=("192.168.10.191" "192.168.10.192" "192.168.10.193" "192.168.10.194")
HOSTS=("192.168.10.64")
PASSWORD="Wind@2015"

# 接收命令
CMD=$1

function exec_cmd(){
echo $1"开始执行："${CMD}"...."

/usr/bin/expect <<EOF
set timeout 2
spawn ssh $1
expect {
        "(yes/no)" {send "yes\r"; exp_continue}
        "password:" {send "$PASSWORD\r"}
}
sleep 2
expect "root@*"  {send "${CMD}\r"}
sleep 1
expect "root@*"  {send "exit\r"}
expect eof 
EOF

}


for host in ${HOSTS[@]}
do
    exec_cmd $host
done

