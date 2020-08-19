frpc.ini
```
[common]
server_addr = 120.27.240.227
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000

[web]
type = http
local_ip = 127.0.0.1
local_port = 8899
custom_domains = 120.27.240.227
```



nohup ./frpc -c frpc.ini &