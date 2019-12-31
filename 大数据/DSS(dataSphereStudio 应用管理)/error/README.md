# 创建工程

1. add scheduler project failederrCode: 90019 ,desc: Connect to 172.16.42.10:8091 [/172.16.42.10] failed: Connection refused (Connection refused) ,ip: slave2 ,port: 9004 ,serviceKind: dss-server"

DSS-SERVER需要配置azkaban

端口为azkaban web端口
```
##azkaban
wds.dss.appjoint.scheduler.azkaban.address=https://slave1:8443
```