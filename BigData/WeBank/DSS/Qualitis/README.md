<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-07-16 09:49:20
 -->
[网址](https://github.com/WeBankFinTech/Qualitis/tree/master/docs/zh_CN/ch1)

Qualitis基于Spring Boot，依赖于Linkis进行数据计算，提供数据质量模型构建，数据质量模型执行，数据质量任务管理，异常数据发现保存以及数据质量报表生成等功能。并提供了金融级数据质量模型资源隔离，资源管控，权限隔离等企业特性，具备高并发，高性能，高可用的大数据质量管理能力。



 spark.network.timeout



 1.Caused by: java.net.ConnectException: Connection refused (Connection refused)

 application-dev.yml 文件中两处jdbc连接更改为IP地址

