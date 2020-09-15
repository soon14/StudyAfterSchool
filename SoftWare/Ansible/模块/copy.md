<!--
 * @Author: wjn
 * @Date: 2020-09-11 09:30:33
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-11 09:30:33
-->
https://docs.ansible.com/ansible/latest/modules/copy_module.html

Parameter| comments
-|-
src| 文件地址，若为目录则递归复制到远程，若以/结尾则只复制目录内文件

    src: /srv/myfiles/foo.conf
    dest: /etc/foo.conf
