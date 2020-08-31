<!--
 * @Author: wjn
 * @Date: 2020-03-04 15:29:34
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-04 16:19:36
 -->
 1. 容器启动后就停止

 docker 需要有个前台进程，如果定义的容器命令是后台进程，进程运行结束docker就会停止容器

 除去java -jar  后的&

 2. Failed to Setup IP tables: Unable to enable SKIP DNAT rule:  (iptables failed: iptables --wait -t nat -I DOCKER -i br-fc92854e1c37 -j RETURN: iptables: No chain/target/match by that name.
 (exit status 1))

 关闭防火墙后需要重启docker

 systemctl restart docker