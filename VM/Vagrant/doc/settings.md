<!--
 * @Author: wjn
 * @Date: 2020-08-29 00:38:59
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-29 00:50:50
-->
# 内存、cpu

```
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end
```

# ip 

config.vm.network "private_network", ip: "192.168.33.10"

# 开启root访问

1. vi /etc/ssh/sshd_config


PasswordAuthentication yes
#PasswordAuthentication no

PermitRootLogin yes


2. systemctl restart sshd