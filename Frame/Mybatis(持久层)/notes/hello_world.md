<!--
 * @Author: wjn
 * @Date: 2020-02-15 15:14:56
 * @LastEditors: wjn
 * @LastEditTime: 2020-04-09 12:27:25
 -->



# 接口式编程

1. 创建接口

```
package com.fd.mybatis.dao;

import java.util.List;

public interface Person {
    public List<PersonMapper> getPerson();
}

```

2. 创建sql配置文件映射接口

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--名称空间指定为接口的全类名-->
<mapper namespace="com.fd.mybatis.dao.Person">
    <!--id指定为对应的抽象方法-->
    <select id="getPerson" resultType="com.fd.mybatis.dao.PersonMapper">
    select * from t_person
  </select>
</mapper>

```

3. 全局配置文件中添加sql配置文件

4. 代码

    1. 根据全局配置文件得到SqlSessionFactory；
    ```
    String resource = "mybatis/mybatis-config.xml";
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory =
            new SqlSessionFactoryBuilder().build(inputStream);
    ```
    2. 使用SqlSessionFactory获取到sqlSession对象用它实现增删改查 一个sqlSession代表和数据库的一次会话，用完关闭
    ```
    SqlSession sqlSession = sqlSessionFactory.openSession();
    ```
    3. 指定mapper
    ```
    Person mapper = sqlSession.getMapper(Person.class);
    List person = mapper.getPerson();
    System.out.println(person);
    ```


1. 编写全局配置文件

```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://47.93.232.114:3306/quickbi"/>
                <property name="username" value="root"/>
                <property name="password" value="123456"/>
            </dataSource>
        </environment>
    </environments>
    <!--将写好的sql配置文件映射到全局配置文件中-->
    <mappers>
        <mapper resource="mapper/person.xml"/>
    </mappers>
</configuration>
```

2. sql 映射文件，配置了每一个sql,以及sql的封装规则

3. 将sql映射文件注册在全局配置文件中

4. 写代码
    1. 根据全局配置文件得到SqlSessionFactory；
    2. 使用SqlSessionFactory获取到sqlSession对象用它实现增删改查 一个sqlSession代表和数据库的一次会话，用完关闭
    3. 使用sql的唯一标识告诉Mybatis执行哪个sql，sql都是保存在sql映射文件中的






    