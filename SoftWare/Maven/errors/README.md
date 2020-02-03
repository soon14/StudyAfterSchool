1. 导入存在的依赖后依旧爆红

把对应项目的pom.xml中相关依赖剪切，然后回退即可，

总结：当不是由于引入jar包不存在的情况的时候，就要考虑到这种情况问题（IDEA的BUG），先删除pom.xml文件的依赖，然后执行Maven的clean方法，最后回撤删除的pom.xml文件的依赖，即可成功。

2. 阿里云仓库找不到依赖

pom.xml文件中添加

```
<repositories>
        <repository>
            <id>aliyun-repos</id>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
    </repositories>
 
    <pluginRepositories>
        <pluginRepository>
            <id>aliyun-plugin</id>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </pluginRepository>
    </pluginRepositories>
```