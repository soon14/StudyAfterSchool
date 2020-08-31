<!--
 * @Author: wjn
 * @Date: 2020-03-01 22:51:56
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-02 15:48:58
 -->
# 集成cdh

## 编译

**需要添加cloudera仓库**

    allprojects {
    repositories {
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public/' }
        maven{ url 'http://maven.aliyun.com/nexus/content/repositories/jcenter'}
        //    cloudera
        maven{ url 'https://repository.cloudera.com/artifactory/cloudera-repos/'}
    }
    }

## 部署

**mysql ssl问题**

    jdbc后添加&useSSL=false
    
1. 需要移除jasper*相关依赖
2. 需要解压conf/static中的静态文件
3. netty-3.9.2.Final.jar(比该版本高的，会报NoSuchMethodError: org.jboss.netty.handler.codec.http.HttpRequest.setHeader)  
4. 需要在hive中创建{username}_ind数据库用于存储错误数据



# 尝试

将mysql-connect.jar传到spark worker节点


## 成功
dss的数据库配置将127.0.0.1都改为IP地址  