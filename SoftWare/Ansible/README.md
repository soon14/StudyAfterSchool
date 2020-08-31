# 自动化部署管理

yum install ansible





















# [How to build your inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#intro-inventory)

## Adding ranges of hosts

# [Working With Playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html)

# [yum – Manages packages with the yum package manager](https://docs.ansible.com/ansible/latest/modules/yum_module.html)

1. 只执行指定的标签命令
```
      name: cs
      tags: 
        - test
```
ansible-playbook playbook.yml --tags="test"
ansible-playbook playbook.yml -i host.yml --tags="test"


2. 获取本节点ip
{{ ansible_default_ipv4['address'] }}



模块名	作用
command	执行命令模块（重要）
copy	文件拷贝模块（重要）
shell	执行shell脚本模块（重要）
script	执行shell脚本模块（重要）
file	设定文件属性模块
service	系统服务管理模块
cron	计划任务管理模块
yum	yum软件包安装管理模块
synchronize	使用rsync同步文件模块


3. 输出内置变量

```
  - name: print all 内置 vars
    debug: var=hostvars[inventory_hostname]
    tags: test
```