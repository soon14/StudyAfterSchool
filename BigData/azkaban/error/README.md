
1. executor became inactive before setting up the flow 2

首次运行需要手动激活executor

端口在日志中查看
curl http://${executorHost}:${executorPort}/executor?action=activate

curl http://192.168.10.190:43247/executor?action=activate