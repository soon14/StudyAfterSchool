###
 # @Author: wjn
 # @Date: 2020-09-07 08:16:06
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-08 01:15:15
### 
#!/bin/bash

# ansible-playbook playbook.yml -i host.yml --tags="python"

# ansible-playbook playbook.yml -i host.yml --tags="cmake"

# ansible-playbook playbook.yml -i host.yml --tags="boost"

# ansible-playbook playbook.yml -i host.yml --tags="dlib"

# 安装依赖
# ansible-playbook playbook.yml -i host.yml --tags="dep" 

# ansible-playbook playbook.yml -i host.yml --tags="click"

ansible-playbook playbook.yml -i host.yml --tags="face_recognition"
