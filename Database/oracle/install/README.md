https://blog.csdn.net/ming19951224/article/details/88599031

CREATE TABLESPACE ERP_COMPANY DATAFILE '/data/ERP_COMPANY.dbf' SIZE 10m AUTOEXTEND ON NEXT 10m MAXSIZE 20480m EXTENT MANAGEMENT LOCAL;



```
function createDb(ms,mm){
    var t = `
    create tablespace "{MS}" datafile '{MS}01.DBF' size 10m autoextend on next 10m maxsize 20480m extent management local;
 
--建议每个用户单独规划一个表空间,便于单独管理
--根据数据量,每个表空间规划多个数据文件,分散io压力
 
CREATE USER {MS} IDENTIFIED BY "{MM}" DEFAULT TABLESPACE {MS};
GRANT DBA TO {MS};       --赋予dba权限
GRANT RESOURCE TO {MS};  --赋予普通权限
    `;
    return t.replace(/{MS}/g,ms).replace(/{MM}/g,mm)
}
createDb('ZFW_WW_HJ','ZFW_WW_HJ') 

```

```
create tablespace "DATA_GOVERNANCE" datafile 'DATA_GOVERNANCE01.DBF' size 10m autoextend on next 10m maxsize 20480m extent management local;
 
--建议每个用户单独规划一个表空间,便于单独管理
--根据数据量,每个表空间规划多个数据文件,分散io压力
 
CREATE USER DATA_GOVERNANCE IDENTIFIED BY "DATA_GOVERNANCE" DEFAULT TABLESPACE DATA_GOVERNANCE;
GRANT DBA TO DATA_GOVERNANCE;       --赋予dba权限
GRANT RESOURCE TO DATA_GOVERNANCE;  --赋予普通权限
```