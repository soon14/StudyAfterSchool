1. oozie 共享目录下创建spark2目录

```
hdfs dfs -mkdir /user/oozie/share/lib/lib_20181023195700/spark2
```

2. 将spark2目录下的jars和oozie-sharelib-spark*.jar添加到创建的spark2目录下


cd /opt/cloudera/parcels/SPARK2-2.3.0.cloudera2-1.cdh5.13.3.p0.316101/lib/spark2/jars

hdfs dfs -put *.jar /user/oozie/share/lib/lib_20181023195700/spark2


cd /opt/cloudera/parcels/CDH-5.13.2-1.cdh5.13.2.p0.3/lib/oozie/oozie-sharelib-yarn/lib/spark

hdfs dfs -put oozie-sharelib-spark*.jar /user/oozie/share/lib/lib_20181023195700/spark2

3. 修改目录属主及权限

hdfs dfs -chown -R oozie:oozie /user/oozie/share/lib/lib_20181023195700/spark2

报错：chown: changing ownership of '/user/oozie/share/lib/lib_20181023195700/spark2': Non-super user cannot change owner

切换为hdfs用户进行更改

hdfs dfs -chmod -R 775 /user/oozie/share/lib/lib_20181023195700/spark2


4. 查看共享库
oozie admin -oozie http://node37:11000/oozie -shareliblist

5. 更新共享库
oozie admin -oozie http://node37:11000/oozie -sharelibupdate


