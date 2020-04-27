<!--
 * @Author: wjn
 * @Date: 2020-04-27 14:37:02
 * @LastEditors: wjn
 * @LastEditTime: 2020-04-27 14:52:01
 -->

# unsigned int mysql中的unsigned

整型的每一种都有无符号（unsigned）和有符号（signed）两种类型（float和double总是带符号的），在默认情况下声明的整型变量都是有符号的类型（char有点特别），如果需声明无符号类型的话就需要在类型前加上unsigned。无符号版本和有符号版本的区别就是无符号类型能保存2倍于有符号类型的正整数数据，比如16位系统中一个int能存储的数据的范围为-32768~32767，而unsigned能存储的数据范围则是0~65535。由于在计算机中,整数是以补码形式存放的。根据最高位的不同，如果是1,有符号数的话就是负数；如果是无符号数,则都解释为正数。另外，unsigned若省略后一个关键字，大多数编译器都会认为是unsigned int。
在sql语句中的意义
sql语句中，创建一个数据表时
create table user{
user_id int unsigned…
…
}

# 索引
B-TREE索引
B-TREE索引的特点

B-TREEB-TREE以B+树结构存储数据，大大加快了数据的查询速度
B-TREE索引在范围查找的SQL语句中更加适合（顺序存储）
 

B-TREE索引使用场景

全值匹配的查询SQL，如 where act_id= '1111_act'
联合索引汇中匹配到最左前缀查询，如联合索引 KEY idx_actid_name(act_id,act_name) USING BTREE，只要条件中使用到了联合索引的第一列，就会用到该索引，但如果查询使用到的是联合索引的第二列act_name，该SQL则便无法使用到该联合索引（注：覆盖索引除外）
匹配模糊查询的前匹配，如where act_name like '11_act%'
匹配范围值的SQL查询，如where act_date > '9865123547215'（not in和<>无法使用索引）
覆盖索引的SQL查询，就是说select出来的字段都建立了索引
 

HASH索引
HASH的特点

Hash索引基于Hash表实现，只有查询条件精确匹配Hash索引中的所有列才会用到hash索引
存储引擎会为Hash索引中的每一列都计算hash码，Hash索引中存储的即hash码，所以每次读取都会进行两次查询
Hash索引无法用于排序
Hash不适用于区分度小的列上，如性别字段