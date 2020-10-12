<!--
 * @Author: wjn
 * @Date: 2020-10-10 14:21:17
 * @LastEditors: wjn
 * @LastEditTime: 2020-10-10 17:38:22
-->

表和视图
    USE 数据库;
    SELECT
        t1.name AS 'name',
        CONVERT(varchar(500),t2.value) AS 'comment',
        CASE t1.xtype WHEN 'u' THEN 'TABLE' ELSE 'VIEW' END 'type'	
    FROM
        sysobjects t1
    LEFT JOIN sys.extended_properties t2 
        ON t1.id= t2.major_id AND t2.minor_id= 0 
    WHERE
        t1.xtype= 'u' 
        OR t1.xtype= 'v';

表字段

    SELECT
        t2.name AS 'name',
        t3.name AS 'type',
    t2.max_length AS 'length',
        t2.scale AS 'decimals',
        CONVERT ( VARCHAR ( 200 ), t4.value ) AS 'comment', 
        CASE t2.is_nullable WHEN '1' THEN'true' ELSE 'false' END 'notNull',
        CASE t6.is_primary_key WHEN '1' THEN 'true' ELSE 'false' END 'primaryKey'
    FROM
        sys.tables t1
        LEFT JOIN sys.columns t2 ON t1.object_id = t2.object_id
        LEFT JOIN sys.types t3 ON t2.user_type_id = t3.user_type_id
        LEFT JOIN sys.extended_properties t4 ON t4.major_id = t2.object_id and t4.minor_id = t2.column_id 
        LEFT JOIN sys.index_columns t5 ON t5.object_id = t2.object_id and t5.column_id = t2.column_id
        LEFT JOIN sys.indexes t6 ON t6.object_id = t5.object_id AND t6.index_id= t5.index_id
    WHERE 
        t1.name = ?;






