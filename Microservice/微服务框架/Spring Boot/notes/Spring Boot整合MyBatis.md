



# tk.mybatis

mybatis:
  mapper-locations: classpath:mapper/*.xml  配置文件存储位置
  type-aliases-package: 实体类的存储路径 如：com.example.demo.spring.boot.mybatis.entity

# 创建通用的父类接口

```
package tk.mybatis;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * 自己的 Mapper
 * 特别注意， 该接口不能被扫描到，否则会出错
 * 
 * @param <T>
 */

public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T> {
}

```



# 整合PageHelper

Mybatis 分页插件，支持多数据库，多数据源

## 引入依赖

```
<!-- https://mvnrepository.com/artifact/com.github.pagehelper/pagehelper-spring-boot-starter -->
<dependency>
    <groupId>com.github.pagehelper</groupId>
    <artifactId>pagehelper-spring-boot-starter</artifactId>
    <version>1.2.5</version>
</dependency>
```

# 使用mybatis maven插件生成代码

## 配置插件

## jdbc.properties

```
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://192.168.137.101:3306/数据库名?characterEncoding=utf-8
jdbc.username=root
jdbc.password=123456
```

## generatorConfiguration.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>

    <!--数据库连接的信息-->
    <properties resource="jdbc.properties"/>

    <!--targetRuntime="MyBatis3" 目标环境
       MyBatis3：豪华版，复杂多条件查询
       MyBatis3Simple：helloWorld -->
    <context id="mysql" targetRuntime="MyBatis3" defaultModelType="flat">
        <commentGenerator>
            <!-- 是否去除自动生成的注释 true:是;false:否 -->
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>

        <!--配置tk.mybatis插件-->
        <plugin type="tk.mybatis.mapper.generator.MapperPlugin">
            <property name="mappers" value="com.tonghang.configure.BaseMapper"/> <!--继承接口-->
        </plugin>


        <jdbcConnection driverClass="${jdbc.driverClass}"
                        connectionURL="${jdbc.connectionURL}"
                        userId="${jdbc.username}"
                        password="${jdbc.password}">
        </jdbcConnection>

        <!-- targetProject:生成Entity类的路径 -->
        <javaModelGenerator targetProject="src/main/java"
                            targetPackage="com.example.demo.spring.boot.mybatis.entity">
        </javaModelGenerator>

        <!-- targetProject:XxxMapper.xml映射文件生成的路径 -->
        <sqlMapGenerator targetProject="/src/main/resources"
                         targetPackage="mapper">
        </sqlMapGenerator>

        <!-- 默认false，把JDBC DECIMAL 和 NUMERIC 类型解析为 Integer，为 true时把JDBC DECIMAL
           和 NUMERIC 类型解析为java.math.BigDecimal -->
        <javaTypeResolver>
            <property name="forceBigDecimals" value="true"/>
        </javaTypeResolver>

        <!-- targetPackage：Mapper接口生成的位置 -->
        <javaClientGenerator targetProject="/src/main/java"
                             targetPackage="com.example.demo.spring.boot.mybatis.mapper"
                             type="XMLMAPPER">
        </javaClientGenerator>

<!--        配置要生成的表，%代表所有-->
        <table tableName="%">
            <generatedKey column="id" sqlStatement="Mysql" identity="true"/>
        </table>
    </context>
</generatorConfiguration>

```