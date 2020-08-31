在执行一个 playbook 之前,想看看这个 playbook 的执行会影响到哪些 hosts
> ansible-playbook playbook.yml -i host.yml --list-hosts



python -m pip install ansible




捕获错误

```
- name: Configure webserver with nginx
  hosts: webservers
  tasks:
    - name: install nginx
      yum: 
        name: nginx
      ignore_errors: True
      register: out  #定义变量存储返回的结果
    - debug: var=out verbosity=0    #debug的模块显示输出的记过
```




