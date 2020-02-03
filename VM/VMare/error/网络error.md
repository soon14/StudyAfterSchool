1. 虚拟机无法连接外网
> 查看vm服务是否启动
2. DNS 无法解析
```
vi /etc/resolv.conf 
nameserver 8.8.8.8
nameserver 8.8.4.4
```
3. RTNETLINK answers: File exists  
原因：服务冲突  
解决：
```
systemctl stop NetworkManager
systemctl stop network
```
重启服务：
```
systemctl start network
systemctl enable  network
```



4. destination host unreachable

ping 8.8.8.8 

如果接受不到数据则网关设置错误，调整网关和宿主机的Vmware 8 的网关一致