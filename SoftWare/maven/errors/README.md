1.  No plugin found for prefix 'install'
检查maven 的配置文件settings.xml  中localRepository 是否配置正确

2. maven install时报错Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.12.4:test

添加参数-Dmaven.test.skip=true
```
mvn clean install -Dmaven.test.skip=true
```

