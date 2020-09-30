<!--
 * @Author: wjn
 * @Date: 2020-09-25 10:03:52
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-25 10:56:44
-->
$ vim /etc/profile 
---------------------------------------------------------------------------------------- 
MAVEN_HOME=/usr/local/apache-maven-3.5.0 
export MAVEN_HOME 
export PATH=${PATH}:${MAVEN_HOME}/bin 
export MAVEN_OPTS="-Xms1024m -Xmx4084m" 
---------------------------------------------------------------------------------------- 