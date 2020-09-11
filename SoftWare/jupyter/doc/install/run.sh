###
 # @Author: wjn
 # @Date: 2020-09-08 17:20:05
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-11 10:57:36
### 
#!/bin/bash

# 1. 安装python3环境
yum install -y python3
# 2. 安装jupyter
pip3 install jupyter

python3 -m pip install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple jupyter
python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pysqlite3

python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple matplotlib

vi /home/flydack/.virtualenvs/numpy_/lib/python3.7/site-packages/notebook/services/sessions/sessionmanager.py

将 import pysqlite2 修改为pysqlite3即可。

python3 -m  pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
# 3. 安装expect 
yum install -y expect


# 4. 创建用户

/usr/bin/expect <<EOF
set timeout 2
jupyter notebook password
expect {
        "Enter password:" {send "123"; exp_continue}
        "Verify password:" {send "123\r"}
}
sleep 2
expect eof 
EOF


# 5. 启动  指定目录为/home 
jupyter notebook --ip=0.0.0.0 --no-browser --allow-root /home