<!--
 * @Author: wjn
 * @Date: 2020-03-03 15:21:14
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-03 16:50:13
 -->
# 变量

命名空间| 使用权限| 描述
-|-|-
hivevar| r/w| 用户自定义变量
hiveconf| r/w| hive相关配置属性
system| r/w| java定义的配置属性
env| r| shell环境定义的环境变量

## hivevar

定义
* set hivevar:name=wjn;

    *hivevar可以省略*

使用
* select * from t where i = ${hivevar:name};

