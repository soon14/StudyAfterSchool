```
#!/bin/bash


DB_NAME=datemark
TABLE_NAME=year_total_maintenancefee

sql=$(cat <<EOF

-------------
--本年累计维修费用（万元）
-------------
CREATE TABLE if not exists datemark.year_total_maintenancefee (
factory varchar(255),
value double )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('serialization.null.format'='');
insert OVERWRITE TABLE datemark.year_total_maintenancefee
SELECT gro.sname AS factory, tmp.value
FROM (
    SELECT factory, SUM(value) / 10000 AS value
    FROM efiot.dws_ef_financial_plan_month_sj
    WHERE YEAR(from_unixtime(dt)) = YEAR(CURRENT_DATE())
        AND index = '修理修缮费'
    GROUP BY factory
) tmp
    LEFT JOIN efiot.dwc_ef_group gro ON gro.code = tmp.factory;


EOF
)



echo $sql

$HIVE_HOME/bin/hive -e "$sql"


```