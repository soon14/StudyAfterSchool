<!--
 * @Author: wjn
 * @Date: 2020-09-06 12:33:27
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 14:14:32
-->
* 容器启动后就停止

        docker 需要有个前台进程，如果定义的容器命令是后台进程，进程运行结束docker就会停止容器

        除去java -jar  后的&

 * Failed to Setup IP tables: Unable to enable SKIP DNAT rule:  (iptables failed: iptables --wait -t nat -I DOCKER -i br-fc92854e1c37 -j RETURN: iptables: No chain/target/match by that name.
 (exit status 1))

        关闭防火墙后需要重启docker

        systemctl restart docker

*  Failed to Setup IP tables: Unable to enable SKIP DNAT rule:

        原因是关闭防火墙之后docker需要重启，执行以下命令重启docker即可

* TLS handshake timeout

        连接超时问题，可以重新运行命令或使用国内镜像,使用阿里镜像