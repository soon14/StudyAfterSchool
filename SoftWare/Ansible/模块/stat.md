<!--
 * @Author: wjn
 * @Date: 2020-09-16 09:55:08
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-16 09:55:09
-->
- name: Check if clock file exists.
  stat: path=/etc/sysconfig/clock
  register: clock_file

- name: Create clock file if it doesn't exist.
  template:
    src: clock.j2
    dest: /etc/sysconfig/clock
  when: not clock_file.stat.exists | bool