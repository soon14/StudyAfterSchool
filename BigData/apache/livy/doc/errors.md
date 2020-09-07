<!--
 * @Author: wjn
 * @Date: 2020-09-06 05:58:51
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:20:34
-->
* Error found before invoking supervisord: 'getpwnam(): name not found: livy'

      创建livy用户，并加入root组

      usermod -a -G root livy

      chmod +x /opt/cloudera/parcels/LIVY-0.5.0/bin/livy-server

* User: livy is not allowed to impersonate yarn ERROR:

      修改hadoop的配置文件core-site.xml，增加如下内容：
      <property>
         <name>hadoop.proxyuser.livy.groups</name>
         <value>*</value>
      </property>
      <property>
         <name>hadoop.proxyuser.livy.hosts</name>
         <value>*</value>
      </property>