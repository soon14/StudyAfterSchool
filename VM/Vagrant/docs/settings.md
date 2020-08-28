# 内存、cpu

```
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end
```

# 开启root访问

1. vi /etc/ssh/sshd_config


PasswordAuthentication yes
#PasswordAuthentication no

PermitRootLogin yes


2. systemctl restart sshd