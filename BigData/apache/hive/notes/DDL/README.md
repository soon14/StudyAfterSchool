```
CREATE EXTERNAL TABLE t_dic_list(
id int,
lb string,
name string,
code string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE

```
# 创建表
```
CREATE TABLE IF NOT EXISTS employees(
    name STRiNG COMMENT 'Employee name',
    salary FLOAT COMMENT 'Employee salary',
    subordinates ARRAY<STRING> COMMENT 'Names of subordinates',
    deductions MAP<STRING, FLOAT> COMMENT 'Keys ar deductions names, values are percentages',
    address STRUCT<street:STRING, city:STRING, state:STRING, zip:INT> COMMENT 'Home address')
COMMENT 'Description of the table'
TBLPROPERTIES('creator'='wjn','created_at'='2020-01-28');
```
# 指定分割符

ROW FORMAT DELIMITED  
FIELDS TERMINATED BY '\001'  
COLLECTION ITEMS TERMINATED BY '\002'  
MAP KEYS TERMINATED BY '\003'  
LINES TERMINATED BY '\N'

\001 ^A 的八进制数（字段分隔符）  
\002 ^B 的八进制数(集合元素默认分隔符)  

\003 ^C 的八进制数（map的键和值的分隔符）

# 分区

## 创建分区表


```
CREATE TABLE IF NOT EXISTS employees(
    name STRiNG COMMENT 'Employee name',
    salary FLOAT COMMENT 'Employee salary',
    subordinates ARRAY<STRING> COMMENT 'Names of subordinates',
    deductions MAP<STRING, FLOAT> COMMENT 'Keys ar deductions names, values are percentages',
    address STRUCT<street:STRING, city:STRING, state:STRING, zip:INT> COMMENT 'Home address')
COMMENT 'Description of the table'
PARTITIONED BY (country STRING, state STRING)
```

## 创建分区

1. 在管理表中，用户可以通过载入数据的方式创建分区

    LOAD DATA LOCAL INPATH 'local_path' INTO TABLE table_name PARTITION(country = 'US', state = 'CA');
创建一个US和CA(表示加利福尼亚州)分区

2. 使用修改语句增加分区
    ALTER TABLE table_name ADD PARTITION(country = 'US', state = 'CA')

## 增加、删除、修改和删除分区

### 增加分区
ALTER TALBE log_message ADD IF NOT EXISTS
PARTITION (year = 2011, moth = 1, day = 1) LOCATION '/logs/2011/01/01'
PARTITION (year = 2011, moth = 2, day = 2) LOCATION '/logs/2011/02/02'

## 更改分区路径

ALTER TABLE log_message PARTITION(year = 2011, moth = 2, day = 2)
SET LOCATION 'hdfs://ourbucket/logs/2011/02/02'

### 删除分区

ALTER TABLE log_message DROP IF EXISTS PARTITION(year = 2011, moth = 2, day = 2);

## 查看分区

SHOW PARTITIONS table_name;

### 查看指定分区
SHOW PARTITIONS table_name PARTITION(country='US');

# 列


# 查看表信息

DESCRIBE FORMATTED table_name


# 自定义表存储格式

记录的解析是序列化器（serialize）/反序列化器(deserialize)（缩写SerDe）来控制的

## 自定义SerDe,输入格式，输出格式

通过Avro协议访问文件

```
CREATE TABLE kst
PARTITIONED BY (ds STRING)
ROW FORMAT SERDE 'com.linkedin.haivvreo.AvroSerDe'
WITH SERDEPROPERTIES('schema.url'='http://schema_provider/kst.avsc')
STORED AS 
INPUTFORMAT 'com.linkedin.haivvreo.AvroContainerInputFormat'
OUTPUTFORMAT 'com.linkedin.haivvreo.AvroContainerOutputFormat';
```

ROW FORMAT SERDE --指定使用的SerDe  
WITH SERDEPROPERTIES --传递配置信息给SerDe  
STORED AS INPUTFORMAT...OUTPUTFORMAT.. --分别指定输入格式和输出格式的Java类

# 修改

## 修改表名

ALTER TABLE log_messages RENAME TO logmsgs;


alter table employee set serdeproperties('filed.delim'=',')

## 新增字段

alter table detail_flow_test add columns(original_union_id string COMMENT '注释');

## 修改表字段

Alter table 表名  change column 原字段名称  现字段名称  数据类型

## 
// 删除字段(使用新schema替换原有的)
ALTER TABLE test REPLACE COLUMNS(id BIGINT, name STRING);