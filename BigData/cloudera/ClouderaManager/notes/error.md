<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-17 15:57:54
--> 
# 错误

parcels 加载不出来
http服务错误
安装失败。 无法进行身份验证
scm-web-146:com.cloudera.server.web.cmf.AuthenticationFailureEventListener: Authentication failure for user:

1. parcels 加载不出来

需要清除缓存重新登陆下，同时/opt/cloudera所属用户和组都改为cloudera-scm

2. http服务错误

删除httpd重新安装
> yum remove httpd

> yum install httpd



curl -u admin:admin -X POST http://master:7180/api/v32/clusters/Cluster%201/parcels/products/CDH%205/versions/5.16.2-1.cdh5.16.2.p0.8/commands/deactivate




3. 安装失败。 无法进行身份验证。

自定义存储库是指定cm的位置，不是cdh的位置
示例：
> http://master/cm6/6.2.1/


4. scm-web-146:com.cloudera.server.web.cmf.AuthenticationFailureEventListener: Authentication failure for user:


yum remove cloudera-manager-agent


5. [主机运行状态不良](https://www.2cto.com/net/201805/746045.html)

寻找cm_guid文件的位置删除

/var/lib/cloudera-scm-agent/


6. ERROR    Error, CM server guid updated, expected

 解决方法如下：
    a）停止agent服务    
systemctl stop cloudera-scm-agent
    b）删除原来的cm_guid（不同版本的scm，这个文件的位置可能不一样，可以通过查看命令的找出来：find / -name cm_guid）    
rm /var/lib/cloudera-scm-agent/cm_guid
    c）启动agent服务    
service service-scm-agent start



7. Parcel not distributed but have active state ACTIVATING

删除agent后  注意等待

8. Unexpected container state key:

删除/tmp/hadoop-yarn/ 后重新启动NodeManager

9. nodemanager 无法启动 Unexpected container state key

版本不统一，之前版本的恢复目录需要删除
NodeManager 恢复目录下文件删除
删除 /var/lib/hadoop-yarn/yarn-nm-recovery 下文件


10. The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.

使用qualitis时报这个错误，由于配置文件中的mysql连接地址配的是localhost，更改为具体IP


11. libselinux 冲突




