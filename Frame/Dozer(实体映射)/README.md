<!--
 * @Author: wjn
 * @Date: 2020-05-13 09:27:53
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-14 11:38:01
 -->

<?xml version="1.0" encoding="UTF-8"?>
<mappings xmlns="http://dozermapper.github.io/schema/bean-mapping" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://dozermapper.github.io/schema/bean-mapping
          https://dozermapper.github.io/schema/bean-mapping.xsd">
    <mapping date-format="yyyy-MM-dd">
        <class-a>com.example.Source</class-a>
        <class-b>com.example.Dest</class-b>
        <field>
            <a>info</a>
            <b>name</b>
        </field>
    </mapping>
</mappings>



<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans-2.0.xsd"
       default-autowire="byName" default-lazy-init="false">

    <bean id="mapper" class="com.github.dozermapper.spring.DozerBeanMapperFactoryBean">
        <property name="mappingFiles">
            <list>
                <value>classpath*:dozer/dozer-mapping.xml</value>
            </list>
        </property>
    </bean>
</beans>



@ContextConfiguration(locations = {"classpath:spring-dozer.xml"})


# spring boot 项目必须指定该配置，并且要clean 后重新编译
dozer:
  mapping-files: classpath:dozer/user-mapping.xml



select * from t_person where $name$ ="张三"