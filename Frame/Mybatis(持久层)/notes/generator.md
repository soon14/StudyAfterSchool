<!--
 * @Author: wjn
 * @Date: 2020-04-22 09:14:39
 * @LastEditors: wjn
 * @LastEditTime: 2020-04-22 09:21:59
 -->


# pom.xml

```
<build>
        <plugins>
            <plugin>
                <groupId>org.mybatis.generator</groupId>
                <artifactId>mybatis-generator-maven-plugin</artifactId>
                <version>1.4.0</version>
                <dependencies>
                    <dependency>
                        <groupId>mysql</groupId>
                        <artifactId>mysql-connector-java</artifactId>
                        <version>5.1.46</version>
                    </dependency>
                </dependencies>
            </plugin>
        </plugins>
    </build>
```

# generatorConfig.xml

```
<!DOCTYPE generatorConfiguration PUBLIC
        "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <context id="simple" targetRuntime="MyBatis3Simple">
        <jdbcConnection driverClass="com.mysql.jdbc.Driver" connectionURL="jdbc:mysql://47.93.232.114:3306/quickbi"
                        userId="root" password="123456">
            <property name="nullCatalogMeansCurrent" value="true" />
        </jdbcConnection>

        <javaModelGenerator targetPackage="com.example.model" targetProject="src/main/java"/>

        <sqlMapGenerator targetPackage="mapper" targetProject="src/main/resources"/>

        <javaClientGenerator type="XMLMAPPER" targetPackage="com.example.mapper" targetProject="src/main/java" >
            <property name="rootInterface" value="BaseMapper"></property>
        </javaClientGenerator>

        <table tableName="user" />
    </context>
</generatorConfiguration>
```