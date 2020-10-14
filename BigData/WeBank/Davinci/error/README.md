<!--
 * @Author: wjn
 * @Date: 2020-10-14 14:41:22
 * @LastEditors: wjn
 * @LastEditTime: 2020-10-14 14:42:18
-->


1. Field javaMailSender in edp.core.utils.MailUtils required a bean of type 'org.springframework.mail.javamail.JavaMailSender' that could not be found


application.yml添加

    spring:
    mail:
        host: 127.0.0.1
        port: 8000
        username: wedatasphere
        password: wedatasphere
        nickname: wedatasphere
