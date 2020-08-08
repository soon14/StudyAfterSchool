<!--
 * @Author: wjn
 * @Date: 2020-08-07 14:44:07
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-07 14:44:34
-->
pom.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.3.RELEASE</version>
    </parent>


    <packaging>jar</packaging>

    <groupId>com.example</groupId>
    <artifactId>cdh-eureka</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>cdh-eureka</name>
    <description>Demo project for Spring Boot</description>

    <dependencies>
        <!-- Spring Boot Begin -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
        </dependency>
        <!-- Spring Boot End -->

        <!-- Spring Cloud Begin -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>
            <version>2.0.0.RELEASE</version>
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>**/*.yml</exclude>
                        <exclude>**/*.properties</exclude>
                        <exclude>**/*.sh</exclude>
                        <exclude>**/*.xml</exclude>
                    </excludes>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>exec-maven-plugin</artifactId>
                <version>1.4.0</version>
                <executions>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-assembly-plugin</artifactId>
                <version>2.2.1</version>
                <executions>
                    <execution>
                        <id>assemble</id>
                        <goals>
                            <goal>single</goal>
                        </goals>
                        <!-- install -->
                        <phase>install</phase>
                    </execution>
                </executions>
                <configuration>
                    <appendAssemblyId>false</appendAssemblyId>
                    <attach>false</attach>
                    <descriptors>
                        <descriptor>${basedir}/src/main/assembly/deploy.xml</descriptor>
                    </descriptors>
                    <finalName>${project.artifactId}_${project.version}_1</finalName>
                    <outputDirectory>${project.build.directory}/packages</outputDirectory>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

deploy.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<assembly xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
    <id>dist</id>
    <formats>
        <format>tar.gz</format>
    </formats>
    <includeBaseDirectory>false</includeBaseDirectory>
    <dependencySets>
        <dependencySet>
            <useProjectArtifact>true</useProjectArtifact>
            <outputDirectory>eureka/lib</outputDirectory>
            <scope>runtime</scope>
        </dependencySet>
    </dependencySets>
    <fileSets>
        <fileSet>
            <lineEnding>unix</lineEnding>
            <directory>./src/main/bin</directory>
            <outputDirectory>eureka/bin</outputDirectory>
            <includes>
                <include>**/*</include>
            </includes>
            <fileMode>0755</fileMode>
        </fileSet>
        <fileSet>
            <directory>./src/main/logs</directory>
            <outputDirectory>eureka/logs</outputDirectory>
        </fileSet>
        <fileSet>
            <directory>./src/main/resources</directory>
            <includes>
                <include>**/*</include>
            </includes>
            <outputDirectory>eureka/conf</outputDirectory>
        </fileSet>
    </fileSets>
</assembly>
```