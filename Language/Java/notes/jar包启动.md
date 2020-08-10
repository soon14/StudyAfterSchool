<!--
 * @Author: wjn
 * @Date: 2020-08-06 13:46:35
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-06 16:29:30
-->
 java -jar target/cdh-eureka-0.0.1-SNAPSHOT.jar --spring.config.location=conf/application.yml

 nohup  *****  >  /opt/vpaas-conf/nohup.out 2>&1 &


正确启动方式

> java -classpath lib/*:. com.example.eureka.EurekaApplication