###
 # @Author: wjn
 # @Date: 2020-09-14 03:05:39
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-14 03:06:29
### 
#!/bin/bash


home_bin=$(cd $(dirname $0); pwd)
home_dir=$(cd $(dirname $home_bin); pwd)
hosts_def="$home_dir/hosts.ini"
playbook_def="$home_dir/playbook.yml"

ansible-playbook -i $hosts_def $playbook_def