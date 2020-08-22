<!--
 * @Author: wjn
 * @Date: 2020-08-07 14:44:07
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-07 14:44:34
-->
pom.xml 添加

```
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
                        <descriptor>${basedir}/src/main/assembly/assembly.xml</descriptor>
                    </descriptors>
                    <finalName>${project.artifactId}_${project.version}_1</finalName>
                    <outputDirectory>${project.build.directory}/packages</outputDirectory>
                </configuration>
            </plugin>
        </plugins>
    </build>

```

assembly.xml
```
<?xml version="1.0" encoding="UTF-8"?>
<assembly xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/2.2.1"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/2.2.1 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
    <id>dist</id>
    <formats>
        <format>tar.gz</format>
    </formats>
    <includeBaseDirectory>false</includeBaseDirectory>
    <dependencySets>
        <dependencySet>
            <outputDirectory>服务名称/lib</outputDirectory>
            <useProjectArtifact>true</useProjectArtifact>
            <useTransitiveDependencies>true</useTransitiveDependencies>
            <unpack>false</unpack>
            <useStrictFiltering>true</useStrictFiltering>
            <useTransitiveFiltering>true</useTransitiveFiltering>
        </dependencySet>
    </dependencySets>
    <fileSets>
        <fileSet>
            <lineEnding>unix</lineEnding>
            <directory>./src/main/bin</directory>
            <outputDirectory>服务名称/bin</outputDirectory>
            <includes>
                <include>**/*</include>
            </includes>
            <fileMode>0755</fileMode>
        </fileSet>
        <fileSet>
            <directory>./src/main/logs</directory>
            <outputDirectory>服务名称/logs</outputDirectory>
        </fileSet>
        <fileSet>
            <directory>./src/main/resources</directory>
            <includes>
                <include>**/*</include>
            </includes>
            <outputDirectory>服务名称/conf</outputDirectory>
        </fileSet>
        <fileSet>
            <directory>.</directory>
            <excludes>
                <exclude>*/**</exclude>
            </excludes>
            <outputDirectory>服务名称/logs</outputDirectory>
        </fileSet>
    </fileSets>
</assembly>
```


settings -> schemas and dtds 添加http://maven.apache.org/plugins/maven-assembly-plugin/assembly/2.2.1