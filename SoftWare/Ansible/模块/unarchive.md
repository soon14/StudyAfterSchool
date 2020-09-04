<!--
 * @Author: wjn
 * @Date: 2020-09-04 02:52:40
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-04 02:52:40
-->
https://docs.ansible.com/ansible/latest/modules/unarchive_module.html

Unpacks an archive after (optionally) copying it from the local machine  


```
- name: Extract foo.tgz into /var/lib/foo
  unarchive:
    src: foo.tgz
    dest: /var/lib/foo

- name: Unarchive a file that is already on the remote machine
  unarchive:
    src: /tmp/foo.zip
    dest: /usr/local/bin
    remote_src: yes

- name: Unarchive a file that needs to be downloaded (added in 2.0)
  unarchive:
    src: https://example.com/example.zip
    dest: /usr/local/bin
    remote_src: yes

- name: Unarchive a file with extra options
  unarchive:
    src: /tmp/foo.zip
    dest: /usr/local/bin
    extra_opts:
    - --transform
    - s/^xxx/yyy/
```