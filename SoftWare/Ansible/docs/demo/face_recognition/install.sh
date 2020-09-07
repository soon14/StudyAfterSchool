###
 # @Author: wjn
 # @Date: 2020-09-07 08:16:06
 # @LastEditors: wjn
 # @LastEditTime: 2020-09-07 09:17:04
### 
#!/bin/bash


# ansible-playbook playbook.yml -i host.yml --tags="cmake"

# ansible-playbook playbook.yml -i host.yml --tags="boost"

# ansible-playbook playbook.yml -i host.yml --tags="dlib"

# 安装依赖
python3 -m pip install Click-7.0-py2.py3-none-any.whl face_recognition_models-0.3.0-py2.py3-none-any.whl numpy-1.16.2-cp36-cp36m-manylinux1_x86_64.whl Pillow-5.4.1-cp36-cp36m-manylinux1_x86_64.whl

# ansible-playbook playbook.yml -i host.yml --tags="click"

# ansible-playbook playbook.yml -i host.yml --tags="face_recognition"
