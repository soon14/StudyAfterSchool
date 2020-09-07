<!--
 * @Author: wjn
 * @Date: 2020-09-06 07:19:01
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-06 07:19:54
-->
* broker无法启动

        查看broker.id 是否一致

        vim /var/local/kafka/data/meta.properties
* consumer无法消费到数据
1 partitions have leader brokers without a matching listener, including

        查看配置文件是否有错

        /etc/kafka/conf/kafka-client.conf