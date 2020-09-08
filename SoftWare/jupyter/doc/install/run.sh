#!/bin/bash

# 1. 安装python3环境
yum install -y python3
# 2. 安装jupyter
pip3 install jupyter

# 3. 安装expect
yum install -y expect

# 4. 创建用户

/usr/bin/expect <<EOF
set timeout 2
jupyter notebook password
expect {
        "Enter password:" {send "123456"; exp_continue}
        "Verify password:" {send "123456\r"}
}
sleep 2
expect eof 
EOF


# 5. 启动  指定目录为/home 
jupyter notebook --ip=0.0.0.0 --no-browser --allow-root /home