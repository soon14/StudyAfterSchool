1. Jenkins可安装插件列表没有可选择插件问题
Update Site
http://mirror.xmission.com/jenkins/updates/update-center.json 
http://mirror.esuni.jp/jenkins/updates/update-center.json
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json

使用该镜像源
https://jenkins-zh.gitee.io/update-center-mirror/tsinghua/update-center.json
上面还是会定位到官网


参考：https://blog.csdn.net/oYinHeZhiGuang/article/details/104867525?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param



2. maven 编译无法删除
权限问题

使用root用户运行
vi /etc/sysconfig/jenkins
JENKINS_USER=root
JENKINS_GROUP=root

重启jenkins

参考：https://blog.csdn.net/qq_31977125/article/details/83345424



