```
mvn install:install-file -Dfile=jar包地址 -DgroupId=dm(模型版本) -DartifactId=dm-core(公司标识) -Dversion=1.0(版本号) -Dpackaging=jar(目标文件是哪种格式的包)

```

例

mvn install:install-file -Dfile=Dm7JdbcDriver17.jar -DgroupId=dm -DartifactId=dm-jdbc -Dversion=7 -Dpackaging=jar


        <!-- https://mvnrepository.com/artifact/org.apache.spark/spark-sql -->
        <dependency>
            <groupId>dm</groupId>
            <artifactId>dm-jdbc</artifactId>
            <version>7</version>
            <!--<scope>provided</scope>-->
        </dependency>



2. 

项目下创建lib目录，将jar包放入该目录

```
<dependency>
	<groupId>org.dm.jdbc</groupId>
	<artifactId>dm-jdbc</artifactId>
	<version>7.0.0</version>
	<systemPath>${project.basedir}/lib/Dm7JdbcDriver17.jar</systemPath>
	<scope>system</scope>
</dependency>
```