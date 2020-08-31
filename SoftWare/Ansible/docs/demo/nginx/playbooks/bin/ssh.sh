#!/bin/bash

# install expect
yum -y install expect

# create ssh_key
ssh-keygen -y -t dsa -P '' -f ~/.ssh/id_dsa


HOST_PRE="192.168.50."
PASSWORD="vagrant"

for index in {4..5};
do
HOST=${HOST_PRE}${index}
/usr/bin/expect <<EOF
set timeout 10
spawn ssh-copy-id $HOST
expect {
        "Are you sure you want to continue connecting (yes/no)?" {send "yes\r"; exp_continue}
        "root@$HOST's password" {send "$PASSWORD\r"}
}
sleep 2
EOF
done