<!--
 * @Author: wjn
 * @Date: 2020-08-23 10:01:21
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-29 00:38:41
-->
# ci cd







2. No such plugin: cloudbees-folder   注意用户更改


上面的错误显示是，安装插件cloudbees-folder失败，是因为下载的Jenkins.war里没有cloudbees-folder插件

 需要去 https://updates.jenkins-ci.org/download/plugins/cloudbees-folder/ 下载一个插件

/var/cache/jenkins/war/WEB-INF/detached-plugins



3. 插件下载太慢

/var/lib/jenkins/updates

sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json

sed -i 's/http:\/\/updates.jenkins-ci.org\/download/https:\/\/mirrors.tuna.tsinghua.edu.cn\/jenkins/g' default.json && sed -i 's/http:\/\/www.google.com/https:\/\/www.baidu.com/g' default.json





