1. 判断是否安装jdk，如果没安装进行安装
```
---
- hosts: bigdata
  tasks:
  - command: java --version
    register: result
    ignore_errors: True

  - command: echo "1"
    when: result is failed
```
注意： tasks前要空两格