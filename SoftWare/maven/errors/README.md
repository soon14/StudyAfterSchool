1.  No plugin found for prefix 'install'

检查maven 的配置文件settings.xml  中localRepository 是否配置正确

2. maven install时报错Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.12.4:test

* 命令行
添加参数-Dmaven.test.skip=true
```
mvn clean install -Dmaven.test.skip=true
```
* Intellij 中跳过test

![image](https://github.com/wjn0918/Study/blob/master/SoftWare/images/maven/install_error.png)

3. maven 不能下载jar包 仓库中的依赖包以lastUpdated结尾

原因: 该版本的jar包在中央仓库没有

解决办法: 更改maven资源库,从新下载jar包

在 maven 的 settings.xml文件中添加如下配置

```
<mirrors>
    <mirror>
        <id>mirrorId</id>
        <mirrorOf>repositoryId</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://mvnrepository.com/</url>
    </mirror>
</mirrors>
```
