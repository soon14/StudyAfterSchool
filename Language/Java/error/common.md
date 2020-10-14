<!--
 * @Author: wjn
 * @Date: 2020-10-12 15:33:27
 * @LastEditors: wjn
 * @LastEditTime: 2020-10-12 15:34:27
-->
SLF4J 冲突

项目路径下查看依赖
mvn dependency:tree > cs.txt

排除冲突

    <exclusions>
        <exclusion>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-log4j12</artifactId>
        </exclusion>
    </exclusions>