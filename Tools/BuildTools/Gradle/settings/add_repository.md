<!--
 * @Author: wjn
 * @Date: 2020-02-26 12:35:36
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-26 12:37:16
 -->
# 添加仓库

allprojects {
  repositories {
    maven { url 'http://maven.aliyun.com/nexus/content/groups/public/' }
    maven{ url 'http://maven.aliyun.com/nexus/content/repositories/jcenter'}
    //    cloudera
    maven{ url 'https://repository.cloudera.com/artifactory/cloudera-repos/'}
  }
}